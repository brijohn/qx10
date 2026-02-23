/***************************************************************************
 *                                                                         *
 *    LIBDSK: General floppy and diskimage access library                  *
 *    Copyright (C) 2001,2022  John Elliott <seasip.webmaster@gmail.com>   *
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

/* Simple wrapper around dsk_diagopen() */

#include <stdio.h>
#include <string.h>
#include "config.h"
#ifdef HAVE_LIBGEN_H
# include <libgen.h>
#endif
#include "libdsk.h"
#include "utilopts.h"

#ifdef __PACIFIC__
# define AV0 "DSKID"
#else
# ifdef HAVE_BASENAME
#  define AV0 (basename(argv[0]))
# else
#  define AV0 argv[0]
# endif
#endif

int do_login(int argc, char *outfile, char *outtyp, char *outcomp);

int help(int argc, char **argv)
{
	fprintf(stderr, "Syntax: \n"
                "      %s { options} dskimage \n\n"
		"Options:\n"
                "  -type <type>       Type of disk image file to read.\n"
                "                     '%s -types' lists valid types.\n",
		AV0, AV0);

	fprintf(stderr,"\nDefault type is autodetect.\n\n");
		
	fprintf(stderr, "eg: %s myfile.DSK\n"
                        "    %s -type jv3 data.jv3\n", AV0, AV0);
	return 1;
}

static void report(const char *s)
{
	fprintf(stderr,"%-79.79s\r", s);
	fflush(stderr);
}

static void report_end(void)
{
	fprintf(stderr,"\r%-79.79s\r", "");
	fflush(stderr);
}

static unsigned diag_lines = 0;

static void diag(const char *s)
{
	fprintf(stdout,"%-79.79s\n", s);
	++diag_lines;
}

static void diagend(void) {}



int main(int argc, char **argv)
{
	char *outtyp;
	char *outcomp;
	int n, err;
        int stdret = standard_args(argc, argv); if (!stdret) return 0;

	if (argc < 2) return help(argc, argv);

        ignore_arg("-itype", 2, &argc, argv);
        ignore_arg("-iside", 2, &argc, argv);
        ignore_arg("-icomp", 2, &argc, argv);
        ignore_arg("-otype", 2, &argc, argv);
        ignore_arg("-oside", 2, &argc, argv);
        ignore_arg("-ocomp", 2, &argc, argv);

	outtyp    = check_type("-type", &argc, argv);
	outcomp   = check_type("-comp", &argc, argv);

        if (find_arg("--help",    argc, argv) > 0) return help(argc, argv);
	args_complete(&argc, argv);

	err = 0;
	for (n = 1; n < argc; n++)
	{
		if (do_login(argc, argv[n], outtyp, outcomp))
			++err;
	}
	return err;
}



int do_login(int argc, char *outfile, char *outtyp, char *outcomp)
{
	DSK_PDRIVER outdr = NULL;
	dsk_err_t e;

	dsk_reportfunc_set(report, report_end);	
	e = dsk_diagopen(&outdr, outfile, outtyp, outcomp, diag, diagend);
	if (!e && !diag_lines)
	{
		fprintf(stderr, "Driver [%s] does not support diagnostic "
			"parsing.\n", dsk_drvdesc(outdr));
	}
	if (!e) e = dsk_close(&outdr); else dsk_close(&outdr);

	if (e)
	{
		fprintf(stderr, "%s: %s\n", outfile, dsk_strerror(e));
		return 1;
	}
	return 0;
}

