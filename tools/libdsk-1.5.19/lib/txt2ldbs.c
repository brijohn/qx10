
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include "ldbs.h"


/* Each line (or multiline data block) read in is parsed into one of these */
typedef struct txt_line
{
	char *buf;	/* Buffer containing text of line */
	size_t buflen;	/* Length of valid data in buffer */
	size_t bufmax;	/* Maximum length of buffer */
	int eof;	/* Set if EOF encountered while reading line */

	/* parse_line() will populate: */
	char *section;	/* If [Section] line, text of heading; else NULL */ 
	char *key;	/* If Key=Value line, text of key; else NULL */
	char *value;	/* If Key=Value line, text of value; else NULL */
	int intvalue;	/* If Key=Value line, value parsed as int */
	char *data;	/* If value contains {data} or "data", parsed data */
	size_t datalen; /* Length of parsed data */
} TXT_LINE;

void clear_line(TXT_LINE *line)
{
	line->buf = NULL;
	line->bufmax = 0;
	line->buflen = 0;
	line->eof = 0;
	line->section = NULL;
	line->key = NULL;
	line->value = NULL;
	line->intvalue = 0;
	line->data = NULL;
	line->datalen = 0;
}


void free_line(TXT_LINE *line)
{
	int e = line->eof;

	if (line->buf)  ldbs_free(line->buf);
	if (line->data) ldbs_free(line->data);
	clear_line(line);

	line->eof = e;
}

/* Track and sector headers are built up in memory in a linked list, then
 * flushed to the blockstore when the next track header (or EOF) is 
 * encountered */
typedef struct parsed_sector
{
	struct parsed_sector *next;
	LDBS_SECTOR_ENTRY sec;
} PARSED_SECTOR;

typedef struct parsed_track
{
	int cyl;
	int head;
	LDBS_TRACKHEAD th;
	PARSED_SECTOR *sec;
} PARSED_TRACK;

void clear_track(PARSED_TRACK *trk)
{
	trk->cyl = -1;
	trk->head = -1;
	memset(&trk->th, 0, sizeof(trk->th));
	trk->sec = NULL;
}

void free_track(PARSED_TRACK *trk)
{
	PARSED_SECTOR *ps = trk->sec;

	while (ps)
	{
		PARSED_SECTOR *next = ps->next;
		ldbs_free(ps);
		ps = next;	
	}
	clear_track(trk);
}


dsk_err_t flush_track(PLDBS outfile, PARSED_TRACK *trk)
{
	LDBS_TRACKHEAD *final;
	unsigned seccount = 0;
	unsigned n = 0;
	PARSED_SECTOR *ps;
	dsk_err_t err;

	/* Ensure that the track has a valid cylinder and head; if not, skip */
	if (trk->cyl < 0 || trk->head < 0)
	{
		free_track(trk);
		return DSK_ERR_OK;
	}
	/* Count sectors */
 	for (ps = trk->sec; ps != NULL; ps = ps->next)
	{
		++seccount;
	}
	/* Generate an ldbs_trackhead with the right number of sectors */
	final = ldbs_trackhead_alloc(seccount);
	/* And copy from the temporary structures into that ldbs_trackhead */
	final->datarate  = trk->th.datarate;
	final->recmode   = trk->th.recmode;
	final->gap3      = trk->th.gap3;
	final->filler    = trk->th.filler;
	final->total_len = trk->th.total_len;
 	for (n = 0, ps = trk->sec; ps != NULL; ps = ps->next, n++)
	{
		memcpy(&final->sector[n], &ps->sec, sizeof(LDBS_SECTOR_ENTRY));
	}
	/* Write that trackhead */
	err = ldbs_put_trackhead(outfile, final, trk->cyl, trk->head);
	ldbs_free(final);
	free_track(trk);
	return err;	
}



/* Read in a line from the file and do some minimal lexing */
static dsk_err_t read_line(FILE *fp, TXT_LINE *line)
{
	int c;
	int clast = -1;
	int instring = 0;
	int incomment = 0;
	int indata = 0;

	while ((c = fgetc(fp)) != EOF)
	{
/* If we're in a comment block, just read the rest of the line out of the
 * way. */
		if (incomment)
		{
			if (c == '\n')
			{
				if (indata)
				{
					incomment = 0;
				}
				else
				{
					line->buf[line->buflen++] = 0;
					return DSK_ERR_OK;
				}
			}
			continue;
		}
		/* If in hex data, ignore everything except hex digits, 
		 * end-of-hex, and comment intro characters */
		if (indata && !strchr("0123456789abcdefABCDEF};#", c))
		{
			continue;
		}
		/* Lose whitespace except from within strings */
		if (!instring && (c == ' ' || c == '\t'))
		{
			continue;
		}

		if (!line->buf)
		{
			line->buf = ldbs_malloc(256);
			if (!line->buf) return DSK_ERR_NOMEM;
			line->buflen = 0;
			line->bufmax = 256;
		}
		if (line->buflen == line->bufmax)
		{
			char *newbuf = ldbs_realloc(line->buf, line->bufmax + 256);
			if (!newbuf) return DSK_ERR_NOMEM;
			line->buf = newbuf;
			line->bufmax += 256;
		}
		if (c == '{' && !instring && !indata)	/* Start of hex data */
		{
			indata = 1;
			line->buf[line->buflen++] = c;
			continue;
		}
		if (c == '}' && !instring && indata)	/* End of hex data */
		{
			indata = 0;
			line->buf[line->buflen++] = c;
			continue;
		}
		if (c == '"' && !instring)	/* Start of string */
		{
			instring = 1;
			line->buf[line->buflen++] = c;
			continue;
		}
		if (c == '"' && clast != '\\' && instring) /* End of string */
		{
			instring = 0;
			line->buf[line->buflen++] = c;
			continue;
		}
		if (c == '\n' || c == '\r')
		{
			line->buf[line->buflen++] = 0;
			return DSK_ERR_OK;
		}
		/* Line ends at a comment (unless in a string) */
		if (!instring && (c == '#' || c == ';'))
		{
			incomment = 1;
			continue;
		}
		if (!instring && isupper(c))
		{
			c = tolower(c);
		}
		if (instring && clast == '\\') switch(c)
		{
			case 'n': case 'N': 
				line->buf[line->buflen - 1] = '\n';
				break;
			case 'r': case 'R': 
				line->buf[line->buflen - 1] = '\r';
				break;
			case 't': case 'T': 
				line->buf[line->buflen - 1] = '\t';
				break;
			case '"': 
				line->buf[line->buflen - 1] = '"';
				break;
			case '\\': 
				break;
			default:
				line->buf[line->buflen++] = c;
				break;
		}
		else line->buf[line->buflen++] = c;
		clast = c;
	}
	line->eof = 1;
	return DSK_ERR_OK;
}


static dsk_err_t parse_line(FILE *fp, TXT_LINE *line)
{
	char *p;
	dsk_err_t err = read_line(fp, line);
	char xbuf[3];
	int x, addr;

	if (err) return err;

	if (!line->buf) return DSK_ERR_OK; /* EOF */

	/* Remove UTF-8 BOM if present */
	if (line->buf[0] == 0xEF && line->buf[1] == 0xBB && line->buf[2] == 0xBF)
	{
		memmove(line->buf, line->buf + 3, line->buflen - 3);
		line->buflen -= 3;	
		memset(line->buf + line->buflen, 0, 3);
	}

	/* Check for [Section] heading */
	p = strchr(line->buf, ']');
	if (line->buf[0] == '[' && p != NULL)
	{
		line->section = line->buf + 1;
		*p = 0;
		return DSK_ERR_OK;
	}
	/* Not a [Section]. Is it a  Key=Value line? */
	p = strchr(line->buf, '=');
	if (p)
	{
		line->key = line->buf;	
		*p = 0;
		line->value = p + 1;
	}
	if (line->key && line->value)
	{
/* If so, try to parse the value as hex (0xnn) and decimal (nn) */
		line->data = NULL;
		line->datalen = 0;
		if (line->value[0] == '0' && line->value[1] == 'x')
		{
			sscanf(&line->value[2], "%x", &line->intvalue);
		}
		else if (isdigit(line->value[0]))
		{
			line->intvalue = atoi(line->value);
		}
		else	line->intvalue = -1;

/* If the line is formed "Data=" or "Type=", parse the value for {hex data} 
  or "string data" */
		if (!strcmp(line->key, "data") || !strcmp(line->key, "type"))
		{
			if (line->value[0] == '{')
			{
				p = strrchr(line->value, '}');
				*p = 0;
				line->datalen = (strlen(line->value) - 1) / 2;
				line->data = ldbs_malloc(line->datalen);
				if (!line->data) return DSK_ERR_NOMEM;
				p = line->value + 1;
				addr = 0;
/* Parse hex data into line->data */
				while (*p != 0)
				{
					xbuf[0] = *p++;
					if (*p == 0) xbuf[1] = 0;
					else xbuf[1] = *p++;
					xbuf[2] = 0;
					x = 0;
					sscanf(xbuf, "%02x", &x);
					line->data[addr++] = x;
				}	
			}
			else if (line->value[0] == '"')
			{
				p = strrchr(line->value, '"');
				*p = 0;
				line->datalen = strlen(line->value) - 1;
				line->data = ldbs_malloc(line->datalen);
				if (!line->data) return DSK_ERR_NOMEM;	
				memcpy(line->data, line->value + 1, 
					line->datalen);
			}
		}
	}
	else	/* Must have both key and value */
	{
		line->key = NULL;
		line->value = NULL;
	}
	return DSK_ERR_OK;
}


typedef enum parser_state
{
	START,
	SEEN_LDBS,
	IN_TRACK,
	IN_SECTOR,
	IN_DPB,
	IN_GEOMETRY,
	IN_COMMENT,
	IN_CREATOR,
	IN_BLOCK

} PARSER_STATE;


dsk_err_t parse_track(PARSED_TRACK *track, TXT_LINE *line, char **errormsg)
{
	static char error[160];

	if (!strcmp(line->key, "cylinder"))
	{
		track->cyl = line->intvalue;
	}
	else if (!strcmp(line->key, "head"))
	{
		track->head = line->intvalue;
	}
	else if (!strcmp(line->key, "gap3"))
	{
		track->th.gap3 = line->intvalue;
	}
	else if (!strcmp(line->key, "filler"))
	{
		track->th.filler = line->intvalue;
	}
	else if (!strcmp(line->key, "totallen"))
	{
		track->th.total_len = line->intvalue;
	}
	else if (!strcmp(line->key, "datarate"))
	{
		if      (!strcmp(line->value, "sd")) track->th.datarate = 1;
		else if (!strcmp(line->value, "hd")) track->th.datarate = 2;
		else if (!strcmp(line->value, "ed")) track->th.datarate = 3;
		else if (!strcmp(line->value, "unknown")) track->th.datarate = 4;
		else 
		{
			sprintf(error, "Unexpected value '%s' for data rate",
					line->value);
			*errormsg = error;
		}
	}
	else if (!strcmp(line->key, "recmode"))
	{
		if      (!strcmp(line->value, "unknown")) 
			track->th.recmode = 0;
		else if (!strcmp(line->value, "fm")) 
			track->th.recmode = RECMODE_FM;
		else if (!strcmp(line->value, "mfm")) 
			track->th.recmode = 2;
		else if (!strcmp(line->value, "gcr_mac")) 
			track->th.recmode = RECMODE_GCR_MAC;
		else if (!strcmp(line->value, "gcr_lisa")) 
			track->th.recmode = RECMODE_GCR_LISA;
		else if (!strncmp(line->value, "gcr_mac_", 8)) 
			track->th.recmode = RECMODE_GCR_FIRST + atoi(line->value + 8);
		else 
		{
			sprintf(error, "Unexpected value '%s' for recording mode",
					line->value);
			*errormsg = error;
		}
	}
	return DSK_ERR_OK;
}





dsk_err_t parse_sector(PLDBS outfile, PARSED_TRACK *track, TXT_LINE *line, 
			char **errormsg)
{
	PARSED_SECTOR *sec = track->sec;
	char type[4];

	if (sec == NULL) 
	{
		*errormsg = "Internal error: Parsing unallocated sector";
		return DSK_ERR_CORRUPT;
	}
	/* Go to the most recently added sector */
	while (sec->next != NULL) sec = sec->next;	

	if (!strcmp(line->key, "id.cylinder"))
	{
		sec->sec.id_cyl = line->intvalue;
	}
	else if (!strcmp(line->key, "id.head"))
	{
		sec->sec.id_head = line->intvalue;
	}
	else if (!strcmp(line->key, "id.sector"))
	{
		sec->sec.id_sec = line->intvalue;
	}
	else if (!strcmp(line->key, "id.psh"))
	{
		sec->sec.id_psh = line->intvalue;
	}
	else if (!strcmp(line->key, "status1"))
	{
		sec->sec.st1 = line->intvalue;
	}
	else if (!strcmp(line->key, "status2"))
	{
		sec->sec.st2 = line->intvalue;
	}
	else if (!strcmp(line->key, "copies"))
	{
		sec->sec.copies = line->intvalue;
	}
	else if (!strcmp(line->key, "filler"))
	{
		sec->sec.filler = line->intvalue;
	}
	else if (!strcmp(line->key, "datalen"))
	{
		sec->sec.datalen = line->intvalue;
	}
	else if (!strcmp(line->key, "trailbytes"))
	{
		sec->sec.trail = line->intvalue;
	}
	else if (!strcmp(line->key, "offset"))
	{
		sec->sec.offset = line->intvalue;
	}
	else if (!strcmp(line->key, "data"))
	{
		ldbs_encode_secid(type, track->cyl, track->head, sec->sec.id_sec);
		return ldbs_putblock(outfile, &sec->sec.blockid, type,
				line->data, line->datalen);
	}
	return DSK_ERR_OK;
}


dsk_err_t parse_geom(DSK_GEOMETRY *geom, TXT_LINE *line, char **errormsg)
{
	static char error[160];

	if (!strcmp(line->key, "sides"))
	{
		if      (!strcmp(line->value, "alt")) 
			geom->dg_sidedness = SIDES_ALT;
		else if (!strcmp(line->value, "outback")) 
			geom->dg_sidedness = SIDES_OUTBACK;
		else if (!strcmp(line->value, "outout")) 
			geom->dg_sidedness = SIDES_OUTOUT;
		else if (!strcmp(line->value, "extsurface")) 
			geom->dg_sidedness = SIDES_EXTSURFACE;
		else 
		{
			sprintf(error, "Unknown Sides in [Geometry]: '%s'\n",
				line->value);
			*errormsg = error;
			return DSK_ERR_CORRUPT;
		}
	}
	else if (!strcmp(line->key, "cylinders"))
	{
		geom->dg_cylinders = line->intvalue;
	}
	else if (!strcmp(line->key, "heads"))
	{
		geom->dg_heads = line->intvalue;
	}
	else if (!strcmp(line->key, "sectors"))
	{
		geom->dg_sectors = line->intvalue;
	}
	else if (!strcmp(line->key, "secbase"))
	{
		geom->dg_secbase = line->intvalue;
	}
	else if (!strcmp(line->key, "secsize"))
	{
		geom->dg_secsize = line->intvalue;
	}
	else if (!strcmp(line->key, "rwgap"))
	{
		geom->dg_rwgap = line->intvalue;
	}
	else if (!strcmp(line->key, "fmtgap"))
	{
		geom->dg_fmtgap = line->intvalue;
	}
	else if (!strcmp(line->key, "datarate"))
	{
		if      (!strcmp(line->value, "sd")) geom->dg_datarate = RATE_SD;
		else if (!strcmp(line->value, "dd")) geom->dg_datarate = RATE_DD;
		else if (!strcmp(line->value, "hd")) geom->dg_datarate = RATE_HD;
		else if (!strcmp(line->value, "ed")) geom->dg_datarate = RATE_ED;
		else 
		{
			sprintf(error, "Unexpected value '%s' for data rate in [Geometry]",
					line->value);
			*errormsg = error;
		}
	}
	else if (!strcmp(line->key, "recmode"))
	{
		int recmode = 0; 

		if      (!strcmp(line->value, "mfm")) 
			recmode = RECMODE_MFM;
		else if (!strcmp(line->value, "fm")) 
			recmode = RECMODE_FM;
		else if (!strcmp(line->value, "gcr_mac")) 
			recmode = RECMODE_GCR_MAC;
		else if (!strcmp(line->value, "gcr_lisa")) 
			recmode = RECMODE_GCR_LISA;
		else if (!strncmp(line->value, "gcr_mac_", 8)) 
			recmode = RECMODE_GCR_FIRST + atoi(line->value + 8);
		else 
		{
			sprintf(error, "Unexpected value '%s' for recording mode",
					line->value);
			*errormsg = error;
		}
		geom->dg_fm &= ~RECMODE_MASK;
		geom->dg_fm |= recmode;
	}
	else if (!strcmp(line->key, "complement"))
	{
		if (line->value[0] == 'y') 	geom->dg_fm |= RECMODE_COMPLEMENT;
		else 				geom->dg_fm &= ~RECMODE_COMPLEMENT;
	}
	else if (!strcmp(line->key, "multitrack"))
	{
		geom->dg_nomulti = (line->value[0] == 'n');
	}
	else if (!strcmp(line->key, "skipdeleted"))
	{
		geom->dg_noskip = (line->value[0] == 'n');
	}
	return DSK_ERR_OK;
}


/* The DPB is nearly all numeric fields whose member variables match their
 * textual name, so use the preprocessor to speed things along */

#define DPB_FIELD(field)  \
	else if (!strcmp(line->key, #field)) \
	{ \
		dpb-> field = line->intvalue; \
	} 

dsk_err_t parse_dpb(LDBS_DPB *dpb, TXT_LINE *line, char **errormsg)
{
	if (!strcmp(line->key, "al0"))
	{
		dpb->al[0] = line->intvalue;
	}
	else if (!strcmp(line->key, "al1"))
	{
		dpb->al[1] = line->intvalue;
	}
	DPB_FIELD(spt)
	DPB_FIELD(bsh)
	DPB_FIELD(blm)
	DPB_FIELD(exm)
	DPB_FIELD(dsm)
	DPB_FIELD(drm)
	DPB_FIELD(cks)
	DPB_FIELD(off)
	DPB_FIELD(psh)
	DPB_FIELD(phm)
	return DSK_ERR_OK;
}

dsk_err_t txt2ldbs(FILE *infile, PLDBS outfile, char **errormsg)
{
	TXT_LINE line;
	PARSER_STATE state = START;
	PARSED_TRACK track;
	PARSED_SECTOR *sec = NULL, *s2 = NULL;
	DSK_GEOMETRY geom;
	LDBS_DPB dpb;
	int have_geom = 0;
	int have_dpb = 0;
	int have_blocktype = 0;
	dsk_err_t err;
	char blocktype[4];

	clear_track(&track);
	*errormsg = NULL;
	clear_line(&line);
	do
	{
		parse_line(infile, &line);
		
		if (line.section)
		{
/* Check that the first section heading is [LDBS] */
			if (state == START)
			{
				if (strcmp(line.section, "ldbs"))
				{
					*errormsg = "File does not start with [LDBS] heading.";
					return DSK_ERR_NOTME;
				}
				state = SEEN_LDBS;
				continue;
			}
			else if (!strcmp(line.section, "track"))
			{
				if (track.cyl >= 0 && track.head >= 0)
				{
					err = flush_track(outfile, &track);
					if (err) return err;
				}
				state = IN_TRACK;
			}
			else if (!strcmp(line.section, "sector"))
			{
				if (state != IN_TRACK && state != IN_SECTOR)
				{
					*errormsg = "[Sector] block with no preceding [Track].";
					return DSK_ERR_CORRUPT;

				}
				/* Create a new sector header and parse into it*/
				sec = ldbs_malloc(sizeof(PARSED_SECTOR));
				if (!sec) return DSK_ERR_NOMEM;
				sec->next = NULL;
				memset(&sec->sec, 0, sizeof(sec->sec));
				/* Default cyl / head to match track */
				sec->sec.id_cyl = track.cyl;
				sec->sec.id_head = track.head;
				sec->sec.filler = track.th.filler;
				/* Append newly-allocated sector to end of
				 * linked list */
				if (!track.sec) track.sec = sec;	
				else 
				{
					s2 = track.sec; 	
					while (s2->next != NULL) s2 = s2->next;
					s2->next = sec;
				}
				state = IN_SECTOR;
			}
/* Start of something not a track or sector - flush current track */
			else if (track.cyl >= 0 && track.head >= 0)
			{
				err = flush_track(outfile, &track);
				if (err) return err;
				state = SEEN_LDBS; /* Return to toplevel */
			}
			if (!strcmp(line.section, "comment"))
			{
				state = IN_COMMENT;
			}
			if (!strcmp(line.section, "creator"))
			{
				state = IN_CREATOR;
			}
			else if (!strcmp(line.section, "block"))
			{
				have_blocktype = 0;
				memcpy(blocktype, "????", 4);
				state = IN_BLOCK;
			}
			else if (!strcmp(line.section, "dpb"))
			{
				have_dpb = 1;
				state = IN_DPB;
				memset(&dpb, 0, sizeof(dpb));
			}
			else if (!strcmp(line.section, "geometry"))
			{
				have_geom = 1;
				state = IN_GEOMETRY;
				memset(&geom, 0, sizeof(geom));
			}

		}
/*
		if (line.section)
			printf("Section: %s\n", line.section);
*/
		if (line.key) switch(state)
		{
			case IN_TRACK:
				err = parse_track(&track, &line, errormsg);
				if (err) return err;
				if (*errormsg) return DSK_ERR_CORRUPT;
				break;

			case IN_SECTOR:
				err = parse_sector(outfile, &track, &line, errormsg);
				if (err) return err;
				if (*errormsg) return DSK_ERR_CORRUPT;
				break;

/* [Creator] and [Info] don't need an elaborate parser, since they only have
 * a single Data line */
			case IN_CREATOR:
			case IN_COMMENT:
				if (!strcmp(line.key, "data"))
				{
					err = ldbs_putblock_d(outfile,
						(state == IN_COMMENT) ? 
							LDBS_INFO_TYPE : 
							LDBS_CREATOR_TYPE,
						line.data, line.datalen);
					if (err) return err;
				}
				break;
			case IN_BLOCK:
/* [Block] is similar, but has a separate Type field */
				if (!strcmp(line.key, "type"))
				{
					int len = line.datalen;
					if (len > 4) len = 4;
					memcpy(blocktype, line.data, len);
					have_blocktype = 1;
				}
				if (!strcmp(line.key, "data"))
				{
					if (!have_blocktype)
					{
						*errormsg = "[Block] has Data= but no preceding Type=";
						return DSK_ERR_CORRUPT;
					}
					err = ldbs_putblock_d(outfile,
						blocktype,
						line.data, line.datalen);
					if (err) return err;
				}
				break;
	

			case IN_GEOMETRY:	
				err = parse_geom(&geom, &line, errormsg);
				if (err) return err;
				if (*errormsg) return DSK_ERR_CORRUPT;
				break;
			case IN_DPB:	
				err = parse_dpb(&dpb, &line, errormsg);
				if (err) return err;
				if (*errormsg) return DSK_ERR_CORRUPT;
				break;
			case SEEN_LDBS:
				/* Any global properties for the disk image
				 * would be parsed here. Currently there are
				 * none. */
				break;
			case START:
				/* Should not be any key / value pairs before [LDBS] */
				*errormsg = "File does not start with [LDBS] heading.";
				return DSK_ERR_CORRUPT;
		}
/*
		if (line.key)
			printf("Key: %s Value: (%d) %s\n", line.key, 
				line.intvalue, line.value);

		if (line.data)
			printf("Data: %p length = %d\n", line.data, 
				(int)line.datalen);
*/
		free_line(&line);
	}
	while (!line.eof);	
	/* If we still have a track under construction, flush it */
	if (track.cyl >= 0 && track.head >= 0)
	{
		err = flush_track(outfile, &track);
		if (err) return err;
	}
	if (have_geom)
	{
		err = ldbs_put_geometry(outfile, &geom);
		if (err) return err;
	}
	if (have_dpb)
	{
		err = ldbs_put_dpb(outfile, &dpb);
		if (err) return err;
	}

	return DSK_ERR_OK;
}


#ifdef STANDALONE

const char *wrap_strerror(dsk_err_t err)
{
	static char buf[80];

	switch(err)
	{
		case DSK_ERR_OK: return "OK";
		case DSK_ERR_NOMEM: return "Out of memory";
		case DSK_ERR_SYSERR: return strerror(errno);
		default:
			sprintf(buf, "LibDsk error %d\n", err);
			return buf;

	}
}

int main(int argc, char **argv)
{
	PLDBS outfile;
	const char *outname;
	dsk_err_t err;
	int result = 0;
	FILE *infile = stdin;
	char *errormsg = NULL;

	if (argc < 1)
	{
		fprintf(stderr, "Syntax: %s {textfile} ldbsfile\n", argv[0]);
		return 1;
	}
	if (argc > 2)
	{
		infile = fopen(argv[1], "r");
		if (!infile)
		{
			perror(argv[1]);
			return 1;
		}
		outname = argv[2];
	}
	else
	{
		outname = argv[1];
	}
	err = ldbs_new(&outfile, outname, LDBS_DSK_TYPE);
	if (err)
	{
		fprintf(stderr, "%s: %s\n", outname, wrap_strerror(err));
		return 1;
	}
	err = txt2ldbs(infile, outfile, &errormsg);
	if (!err) err = ldbs_close(&outfile);
	if (err)
	{
		if (errormsg != NULL)
		{
			fprintf(stderr, "Conversion failed: %s\n", errormsg);
		}
		else
		{
			fprintf(stderr, "Conversion failed: %s\n", wrap_strerror(err));
		}
		result = 1;
	}
	if (infile != stdin)
	{
		fclose(infile);
	}
	return result;
}


#endif
