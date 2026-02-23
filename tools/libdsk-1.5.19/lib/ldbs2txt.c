
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include "ldbs.h"

static dsk_err_t dump_type(FILE *outfile, const char *type)
{
	int n;
	int printable = 1;

	for (n = 0; n < 4; n++)
	{
		if (!isalnum(type[n])) 
		{
			printable = 0;
			break;
		}
	} 
	if (printable) fprintf(outfile, "Type = \"%-4.4s\"", type);
	else 
	{
		fprintf(outfile, "Type = { %02x %02x %02x %02x }  ; ", 
			type[0], type[1], type[2], type[3]);
		for (n = 0; n < 4; n++)
		{
			if (isprint(type[n])) 
			{
				fputc(type[n], outfile);
			}
			else
			{
				fputc('.', outfile);
			}
		}
	}
	fputc('\n', outfile);
	return DSK_ERR_OK;
}

static dsk_err_t dump_block(PLDBS infile, FILE *outfile, LDBLOCKID blockid,
		int text)
{
	unsigned char *data;
	char txtbuf[17];
	size_t len, p;
	int x = 0;
	dsk_err_t err;

	err = ldbs_getblock_a(infile, blockid, NULL, (void **)&data, &len);
	if (err) return err;

	/* If text == 1, we would like the block rendered as text if 
	 * possible */
	if (text)
	{
		for (p = 0; p < len; p++)
		{
			if (!isprint(data[p])) 
			{
				text = 0;
				break;
			}
		}
	}
	if (text)
	{
		fprintf(outfile, "Data = \"");
		for (p = 0; p < len; p++)
		{
			switch (data[p])
			{
				case '\n': fprintf(outfile, "\\n"); break;
				case '\t': fprintf(outfile, "\\t"); break;
				case '\r': fprintf(outfile, "\\r"); break;
				case '"': fprintf(outfile, "\\\""); break;
				case '\\': fprintf(outfile, "\\\\"); break;
				default: fprintf(outfile, "%c", data[p]);
	
			}
		}
		fprintf(outfile, "\"\n");
		ldbs_free(data);
		return DSK_ERR_OK;
	}


	fprintf(outfile, "Data = {");
	memset(txtbuf, 0, sizeof(txtbuf));
	for (p = 0; p < len; p++)
	{
		fprintf(outfile, "%02x ", data[p]);
		/* Build human-readable line while printing hex data */
		if (isprint(data[p])) 
		{
			txtbuf[x] = data[p];
		}
		else 
		{
			txtbuf[x] = '.';
		}
 
		++x;
		if (x == 8) fputc(' ', outfile);
		if (x == 16) 
		{
			fprintf(outfile, "  ; %s\n        ", txtbuf);
			memset(txtbuf, 0, sizeof(txtbuf));
			x = 0;
		}
	}
	/* If there is a partial last line, print the text equivalents */
	if (len > 0)
	{
		while (x < 16)
		{
			fprintf(outfile, "   ");
			++x;
			if (x == 8) fputc(' ', outfile);
		}
		fprintf(outfile, "  ; %s\n        ", txtbuf);
	}
	fprintf(outfile, "}\n");
	ldbs_free(data);
	return DSK_ERR_OK;
}



static dsk_err_t dump_track(PLDBS infile, dsk_pcyl_t cyl, dsk_phead_t head,
			LDBS_TRACKHEAD *th, void *param)
{
	LDBS_SECTOR_ENTRY *se;
	FILE *outfile = (FILE *)param;
	unsigned nsec;
	dsk_err_t err;

	fprintf(outfile, "[Track]\n");
	fprintf(outfile, "Cylinder = %d\n", cyl);
	fprintf(outfile, "Head = %d\n", head);
	switch (th->datarate)
	{
		default:
		case 0:
			fprintf(outfile, "DataRate = Unknown\n"); break;
		case 1:	fprintf(outfile, "DataRate = SD\n"); break;
		case 2:	fprintf(outfile, "DataRate = HD\n"); break;
		case 3:	fprintf(outfile, "DataRate = ED\n"); break;
	}
	switch (th->recmode)
	{
		case RECMODE_FM:	fprintf(outfile, "RecMode = FM\n"); 
					break;
		case 0x02: 		fprintf(outfile, "RecMode = MFM\n"); 
					break;
		case RECMODE_GCR_MAC:	fprintf(outfile, "RecMode = GCR_Mac\n"); 
					break;
		case RECMODE_GCR_PRODOS:fprintf(outfile, "RecMode = GCR_Lisa\n"); 
					break;
		case RECMODE_GCR_LISA:	fprintf(outfile, "RecMode = GCR_Prodos\n"); 
					break;
		default:
		if (th->recmode >= RECMODE_GCR_FIRST && 
			th->recmode <= RECMODE_GCR_LAST)
		{
			fprintf(outfile, "RecMode = gcr_mac_%d\n",
				th->recmode - RECMODE_GCR_FIRST); 
		}
		else fprintf(outfile, "RecMode = Unknown\n"); 
		break;
	}
	fprintf(outfile, "GAP3 = 0x%02x\n", th->gap3);
	fprintf(outfile, "Filler = 0x%02x\n", th->filler);
	if (th->total_len)
	{
		fprintf(outfile, "TotalLength = 0x%02x\n", th->total_len);
	}
	fprintf(outfile, "; %d sectors in this track\n\n", th->count);

	for (nsec = 0; nsec < th->count; nsec++)	
	{
		se = &th->sector[nsec];
		fprintf(outfile, "[Sector]\n");
		fprintf(outfile, "ID.Cylinder = %d\n", se->id_cyl);
		fprintf(outfile, "ID.Head = %d\n", se->id_head);
		fprintf(outfile, "ID.Sector = %d\n", se->id_sec);
		fprintf(outfile, "ID.PSH = %d\n", se->id_psh);
		fprintf(outfile, "Status1 = 0x%02x ", se->st1);
		if (se->st1 & 0xB7) fprintf(outfile, " ; ");
		if (se->st1 & 0x80) fprintf(outfile, "End_of_Cylinder  ");
		if (se->st1 & 0x20) fprintf(outfile, "CRC_Error  ");
		if (se->st1 & 0x10) fprintf(outfile, "Overrun  ");
		if (se->st1 & 0x04) fprintf(outfile, "No_Data  ");
		if (se->st1 & 0x02) fprintf(outfile, "Read_Only  ");
		if (se->st1 & 0x01) fprintf(outfile, "Missing_Address_Mark  ");
		fprintf(outfile, "\n");
		fprintf(outfile, "Status2 = 0x%02x ", se->st2);
		if (se->st2 & 0x73) fprintf(outfile, " ; ");
		if (se->st2 & 0x40) fprintf(outfile, "Deleted_Data  ");
		if (se->st2 & 0x20) fprintf(outfile, "Data_Error  ");
		if (se->st2 & 0x10) fprintf(outfile, "Wrong_Cylinder  ");
		if (se->st2 & 0x02) fprintf(outfile, "Bad_Cylinder  ");
		if (se->st2 & 0x01) fprintf(outfile, "Missing_Address_Mark  ");
		fprintf(outfile, "\n");
		fprintf(outfile, "Copies = %d\n", se->copies);
		fprintf(outfile, "Filler = 0x%02x\n", se->filler);
		fprintf(outfile, "DataLen = %d\n", se->datalen);
		if (se->trail)
		{
			fprintf(outfile, "TrailBytes = %d\n", se->trail);
		}
		if (se->offset)
		{
			fprintf(outfile, "Offset = %d\n", se->offset);
		}
		if (se->copies)
		{
			err = dump_block(infile, outfile, se->blockid, 0);
			if (err) return err;
		}
		fprintf(outfile, "\n");
	}

	return DSK_ERR_OK;
}

dsk_err_t ldbs2txt(const char *creator, const char *inname, 
		PLDBS infile, FILE *outfile)
{
	LDBS_TRACKDIR *trackdir;
	LDBS_STATS stats;
	dsk_err_t err;
	int n;

	err = ldbs_get_stats(infile, &stats);
	if (err) return err;	

	fprintf(outfile, "[LDBS]\n\n");

	/* Start with some tourist information */
	if (inname && creator)
	{
		fprintf(outfile, "; Converted from %s by %s\n", inname, creator);
	}
	fprintf(outfile, "; %d cylinders, %d heads. Max %d sectors / track\n",
		stats.max_cylinder + 1 - stats.min_cylinder,
		stats.max_head + 1 - stats.min_head,
		stats.max_spt);
	fprintf(outfile, "; sectors numbered 0x%02x - 0x%02x\n", 
		stats.min_secid, stats.max_secid);


	/* Dump all track and sector blocks */
	err = ldbs_all_tracks(infile, dump_track, SIDES_ALT, outfile);
	if (err) return err;

	/* Dump other blocks */
	err = ldbs_trackdir_copy(infile, &trackdir);
	if (err) return err;
	for (n = 0; n < trackdir->count; n++)
	{
		LDBS_TRACKDIR_ENTRY *te = &trackdir->entry[n];

		/* Track entries are covered by ldbs_all_tracks() above */
		if (te->id[0] == 'T') continue;

		if (!memcmp(te->id, LDBS_CREATOR_TYPE, 4))
		{
			fprintf(outfile, "[Creator]\n");
			dump_block(infile, outfile, te->blockid, 1);
			fprintf(outfile, "\n");
		}
		else if (!memcmp(te->id, LDBS_INFO_TYPE, 4))
		{
			fprintf(outfile, "[Comment]\n");
			dump_block(infile, outfile, te->blockid, 1);
			fprintf(outfile, "\n");
		}
		else if (!memcmp(te->id, LDBS_GEOM_TYPE, 4))
		{
			DSK_GEOMETRY dg;
			int recmode;

			err = ldbs_get_geometry(infile, &dg);
			if (err) return err;

			fprintf(outfile, "[Geometry]\n");
			switch(dg.dg_sidedness)
			{
			        case SIDES_ALT:        
					fprintf(outfile, "Sides = Alt\n");     
					break;
			        case SIDES_OUTOUT:     
					fprintf(outfile, "Sides = OutBack\n"); 
					break;
			        case SIDES_OUTBACK:    
					fprintf(outfile, "Sides = OutOut\n");  
					break;
			        case SIDES_EXTSURFACE: 
					fprintf(outfile, "Sides = ExtSurface\n");  
					break;
			} 

			fprintf(outfile, "Cylinders = %d\n", dg.dg_cylinders);
			fprintf(outfile, "Heads = %d\n", dg.dg_heads);
			fprintf(outfile, "Sectors = %d\n", dg.dg_sectors);
			fprintf(outfile, "SecBase = %d\n", dg.dg_sectors);
			fprintf(outfile, "SecSize = %ld\n", (long)dg.dg_secsize);
			switch(dg.dg_datarate)
			{ 
				case RATE_SD: 
					fprintf(outfile, "DataRate = SD\n"); 
					break;
				case RATE_DD: 
					fprintf(outfile, "DataRate = DD\n"); 
					break;
				case RATE_HD: 
					fprintf(outfile, "DataRate = HD\n"); 
					break;
				case RATE_ED: 
					fprintf(outfile, "DataRate = ED\n"); 
					break;
			}
			fprintf(outfile, "RWGap = %d\n", dg.dg_rwgap);
			fprintf(outfile, "FmtGap = %d\n", dg.dg_fmtgap);
  
			recmode = dg.dg_fm & RECMODE_MASK;
			switch (recmode)
			{
				case RECMODE_MFM:        
					fprintf(outfile, "RecMode = MFM\n"); 
					break;
				case RECMODE_FM:
					fprintf(outfile, "RecMode = FM\n"); 
					break;
			        case RECMODE_GCR_MAC:    
					fprintf(outfile, "RecMode = GCR_MAC\n");
					break;
        			case RECMODE_GCR_LISA:   
					fprintf(outfile, "RecMode = GCR_LISA\n"); 
					break;
				case RECMODE_GCR_PRODOS: 
					fprintf(outfile, "RecMode = GCR_PRODOS\n"); 
					break;
				default: 
					if (recmode >= RECMODE_GCR_FIRST && recmode <= RECMODE_GCR_LAST)
					{
						fprintf(outfile, "RecMode=GCR_MAC_%d\n", (recmode - RECMODE_GCR_FIRST) & 0x1F);
					}
					break;
			}
			fprintf(outfile, "Complement = %c\n", 
				(dg.dg_fm & RECMODE_COMPLEMENT) ? 'Y' : 'N');
			fprintf(outfile, "MultiTrack = %c\n", 
				dg.dg_nomulti ? 'N' : 'Y');
			fprintf(outfile, "SkipDeleted = %c\n", 
				dg.dg_noskip ? 'N' : 'Y');
			fprintf(outfile, "\n");
		}
		else if (!memcmp(te->id, LDBS_DPB_TYPE, 4))
		{
			LDBS_DPB dpb;

			err = ldbs_get_dpb(infile, &dpb);
			if (err) return err;
			fprintf(outfile, "[DPB]  ; Parameters for CP/M filesystem\n");
			fprintf(outfile, "SPT = %5d   ; 128-byte records per track\n", dpb.spt);
			fprintf(outfile, "BSH =  0x%02x   ; Block shift\n", dpb.bsh);
			fprintf(outfile, "BLM =  0x%02x   ; Block mask\n", dpb.blm);
			fprintf(outfile, "EXM =  0x%02x   ; Extent mask\n", dpb.exm);
			fprintf(outfile, "DSM = %5d   ; Block count - 1\n", dpb.dsm);
			fprintf(outfile, "DRM = %5d   ; Directory entries - 1\n", dpb.drm);
			fprintf(outfile, "AL0 =  0x%02x   ; Directory allocation bitmap\n", dpb.al[0]);
			fprintf(outfile, "AL1 =  0x%02x   ; Directory allocation bitmap\n", dpb.al[1]);
			fprintf(outfile, "CKS = %5d   ; Checksum vector size\n", dpb.drm);
			fprintf(outfile, "OFF = %5d   ; Reserved tracks\n", dpb.drm);
			fprintf(outfile, "PSH =  0x%02x   ; Physical sector shift\n", dpb.bsh);
			fprintf(outfile, "PHM =  0x%02x   ; Physical sector mask\n", dpb.blm);
			
			fprintf(outfile, "\n");
		}
		else 
		{
			fprintf(outfile, "[Block]\n");
			dump_type(outfile, te->id);
			dump_block(infile, outfile, te->blockid, 1);
			fprintf(outfile, "\n");
		}
	}
	ldbs_free(trackdir);

	return err;
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
	PLDBS infile;
	dsk_err_t err;
	char type[4];
	int readonly = 1;
	int result = 0;
	const char *outname = "stdout";
	FILE *outfile = stdout;

	if (argc < 1)
	{
		fprintf(stderr, "Syntax: %s ldbsfile {textfile}\n", argv[0]);
		return 1;
	}
	err = ldbs_open(&infile, argv[1], type, &readonly);
	if (err)
	{
		fprintf(stderr, "%s: %s\n", argv[1], wrap_strerror(err));
		return 1;
	}
        if (memcmp(type, LDBS_DSK_TYPE, 4))
        {
                ldbs_close(&infile);
		fprintf(stderr, "%s: File is not a suitable LDBS disk image\n",
			argv[1]);
		return 1;
        }

	if (argc > 2)
	{
		outname = argv[2];
		outfile = fopen(outname, "w");
		if (!outfile) 
		{
			perror(outname);
			ldbs_close(&infile);
			return 1;
		}
	}
	err = ldbs2txt("LDBS " LDBS_VERSION, argv[1], infile, outfile);
	if (err)
	{
		fprintf(stderr, "Conversion failed: %s\n", wrap_strerror(err));
		result = 1;
	}
	if (outfile != stdout)
	{
		if (fclose(outfile))
		{
			perror(outname);
			result = 1;	
		}
	}
	ldbs_close(&infile);
	return result;
}


#endif
