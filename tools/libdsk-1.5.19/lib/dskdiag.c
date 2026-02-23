/***************************************************************************
 *                                                                         *
 *    LIBDSK: General floppy and diskimage access library                  *
 *    Copyright (C) 2001, 2022  John Elliott <seasip.webmaster@gmail.com>  *
 *                                                                         *
 *    This library is free software; you can redistribute it and/or        *
 *    modify it under the terms of the GNU Library General Public          *
 *    License as published by the Free Software Foundation; either         *
 *    version 2 of the License, or (at your option) any later version.     *
 *                                                                         *
 *    This library is distributed in the hope that it will be useful,      *
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of       *
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU    *
 *    Library General Public License for more details.                     *
 *                                                                         *
 *    You should have received a copy of the GNU Library General Public    *
 *    License along with this library; if not, write to the Free           *
 *    Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,      *
 *    MA 02111-1307, USA                                                   *
 *                                                                         *
 ***************************************************************************/

#include "drvi.h"
#include <stdarg.h>

static void clearline(char *line)
{
	sprintf(line, "%-280.280s", "");
	line[34] = '|';
	line[43] = '|';
}

static void putaddr(char *line, unsigned long addr)
{
	char tmp[10];

	sprintf(tmp, "%08lx:", addr);
	memcpy(line, tmp, 9);
}

static void puthex(char *line, unsigned x, unsigned char value)
{
	char tmp[10];

	x = x & 7;
	sprintf(tmp, "%02x", value);
	memcpy(line + 10 + 3 * x, tmp, 2);

	line[35 + x] = isprint(value) ? value : '.';
}

/* Print a subheading */
void diaghead(DSK_REPORTFUNC func, const char *fmt, ...)
{
	va_list ap;
	char line[281];
	int n;

	if (func)
	{
		strcpy(line, "--------  ");
		if (fmt)
		{
			va_start(ap, fmt);
			vsprintf(line + 10, fmt, ap);
			va_end(ap);
		}
		strcat(line, " ");
		for (n = strlen(line); n < 79; n++)
		{
			line[n] = '-';
		}
		if (n < 80)
		{
			line[n] = 0;		
		}
		(*func)("");
		(*func)(line);	
	}
}



/* Diagnostic helper function */
void diaghex(DSK_REPORTFUNC func, unsigned long offset, unsigned char *buf, 
	size_t len, const char *fmt, ...)
{
	char line[281];
	unsigned long a, addr;
	va_list ap;

	if (!func)
	{
		return;
	}
	va_start(ap, fmt);

	clearline(line);
	for (a = 0; a < len; a++)
	{
		addr = offset + a;
		if (addr == offset || (addr & 7) == 0)
		{
			putaddr(line, addr);
		}
		puthex(line, addr & 7, buf[a]);
		/* End of line or end of hex range reached */
		if (((addr & 7) == 7) || (a == len - 1))
		{
			int n;
			if (fmt)
			{
				vsprintf(line + 45, fmt, ap);
				fmt = NULL;
			}
/* Trim off trailing spaces and output */
			n = strlen(line) - 1;
			while (n > 0 && line[n] == ' ')
			{
				line[n] = 0;
			}
			(*func)(line);
			clearline(line);
		}
	}

	va_end(ap);
}


void diagnl(DSK_REPORTFUNC diagfunc)
{
	if (diagfunc) (*diagfunc)("");
}



void diagrawrange(DSK_REPORTFUNC diagfunc, FILE *fp, long start, long count,
	const char *caption)
{
	if (diagfunc)
	{
		unsigned char buf[8];
		unsigned long fpos;
		long fpos0;
		int n = 8;	
		int chunk;
		int first = 1;

		fpos0 = ftell(fp);

		if (count < 0)
		{
			fseek(fp, 0, SEEK_END);
			count = ftell(fp) - start;
		}

		fseek(fp, start, SEEK_SET);
		fpos = start;

		do
		{
			chunk = 8 - (fpos % 8);
			if (chunk > count) chunk = count;

			n = fread(buf, 1, chunk, fp);
			diaghex(diagfunc, fpos, buf, n, 
				(first ? caption : ""));
			fpos += chunk;
			count -= chunk;
			first = 0;
		}	
		while (n >= chunk && count > 0);
		fseek(fp, fpos0, SEEK_SET);
	}
}

