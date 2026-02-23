/***************************************************************************
 *                                                                         *
 *    LIBDSK: General floppy and diskimage access library                  *
 *    Copyright (C) 2001,2020  John Elliott <seasip.webmaster@gmail.com>       *
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

/* Access functions for LDBS-as-text */

#include "drvi.h"
#include "drvldbs.h"
#include "drvldbst.h"


DRV_CLASS dc_ldbstext = 
{
	sizeof(LDBSTXT_DSK_DRIVER),
	&dc_ldbsdisk,		/* superclass */
	"ldbst\0ldbstxt\0",
	"LDBS (text form)",
	ldbst_open,	/* open */
	ldbst_creat,   /* create new */
	ldbst_close,   /* close */
};


#define DC_CHECK(self) if (self->dr_class != &dc_ldbstext && self->dr_class != &dc_ldbstext) return DSK_ERR_BADPTR;




dsk_err_t ldbst_open(DSK_DRIVER *self, const char *filename,
		DSK_REPORTFUNC diagfunc)
{
	LDBSTXT_DSK_DRIVER *ldbst_self;
	char firstline[129];
	dsk_err_t err;
	char *errormsg;
	
	/* Sanity check: Is this meant for our driver? */
	DC_CHECK(self)
	ldbst_self = (LDBSTXT_DSK_DRIVER *)self;

	ldbst_self->ldbst_fp = fopen(filename, "r+t");
	if (!ldbst_self->ldbst_fp) 
	{
		ldbst_self->ldbst_super.ld_readonly = 1;
		ldbst_self->ldbst_fp = fopen(filename, "rt");
	}
	if (!ldbst_self->ldbst_fp) return DSK_ERR_NOTME;
	/* Check for [LDBS] signature */
	if (!fgets(firstline, 128, ldbst_self->ldbst_fp))
	{
		fclose(ldbst_self->ldbst_fp);
		return DSK_ERR_NOTME;
	}
	if (!strstr(firstline, "[LDBS]"))
	{
		fclose(ldbst_self->ldbst_fp);
		return DSK_ERR_NOTME;
	}
	rewind(ldbst_self->ldbst_fp);

	dsk_report("Parsing text-format LDBS file");
	err = ldbs_new(&ldbst_self->ldbst_super.ld_store, NULL, LDBS_DSK_TYPE);
	if (err)
	{
		fclose(ldbst_self->ldbst_fp);
		return err;
	}
	/* And use txt2ldbs to do all the heavy lifting */
	err = txt2ldbs(ldbst_self->ldbst_fp, ldbst_self->ldbst_super.ld_store,
		&errormsg);
	if (err)
	{
#ifndef WIN16
		if (errormsg) fprintf(stderr, "TXT -> LDBS parse error: %s\n",
				errormsg);
#endif
		ldbs_close(&ldbst_self->ldbst_super.ld_store);
		fclose(ldbst_self->ldbst_fp);
		return err;
	}
	dsk_report_end();
	ldbst_self->ldbst_filename = dsk_malloc_string(filename);
	fclose(ldbst_self->ldbst_fp);
	return ldbsdisk_attach(self);
}


/* Create LDBST disk image */
dsk_err_t ldbst_creat(DSK_DRIVER *self, const char *filename)
{
	LDBSTXT_DSK_DRIVER *ldbst_self;
	dsk_err_t err;
	
	/* Sanity check: Is this meant for our driver? */
	DC_CHECK(self)
	ldbst_self = (LDBSTXT_DSK_DRIVER *)self;

	/* Check that the output file can be created */
	ldbst_self->ldbst_fp = fopen(filename, "w+t");
	ldbst_self->ldbst_super.ld_readonly = 0;
	if (!ldbst_self->ldbst_fp) return DSK_ERR_SYSERR;

	fprintf(ldbst_self->ldbst_fp, "[LDBS]\n");
	
	ldbst_self->ldbst_filename = dsk_malloc_string(filename);
	fclose(ldbst_self->ldbst_fp);
	err = ldbs_new(&ldbst_self->ldbst_super.ld_store, NULL, LDBS_DSK_TYPE);
	if (err) return err;
	return ldbsdisk_attach(self);
}




dsk_err_t ldbst_close(DSK_DRIVER *self)
{
	LDBSTXT_DSK_DRIVER *ldbst_self;
	dsk_err_t err;

	DC_CHECK(self)
	ldbst_self = (LDBSTXT_DSK_DRIVER *)self;

	/* Firstly, ensure any pending changes are flushed to the LDBS 
	 * blockstore. Once this has been done we own the blockstore again 
	 * and have to close it after we've finished with it. */
	err = ldbsdisk_detach(self); 
	if (err)
	{
		dsk_free(ldbst_self->ldbst_filename);
		ldbs_close(&ldbst_self->ldbst_super.ld_store);
		return err;
	}

	/* If this disc image has not been written to, just close it and 
	 * dispose thereof. */
	if (!self->dr_dirty)
	{
		dsk_free(ldbst_self->ldbst_filename);
		return ldbs_close(&ldbst_self->ldbst_super.ld_store);
	}
	/* Trying to save changes but source is read-only */
	if (ldbst_self->ldbst_super.ld_readonly)
	{
		dsk_free(ldbst_self->ldbst_filename);
		ldbs_close(&ldbst_self->ldbst_super.ld_store);
		return DSK_ERR_RDONLY;
	}
	dsk_report("Writing LDBS text-format file");

	ldbst_self->ldbst_fp = fopen(ldbst_self->ldbst_filename, "wt");
	if (!ldbst_self->ldbst_fp)
	{
		dsk_free(ldbst_self->ldbst_filename);
		ldbs_close(&ldbst_self->ldbst_super.ld_store);
		dsk_report_end();
		return DSK_ERR_SYSERR;
	}

	err = ldbs2txt("LibDsk " LIBDSK_VERSION, NULL,
			ldbst_self->ldbst_super.ld_store, 
			ldbst_self->ldbst_fp);
	if (err) 
	{
		dsk_free(ldbst_self->ldbst_filename);
		ldbs_close(&ldbst_self->ldbst_super.ld_store);
		dsk_report_end();
		return err;
	}
	dsk_free(ldbst_self->ldbst_filename);
	ldbs_close(&ldbst_self->ldbst_super.ld_store);
	dsk_report_end();
	if (fclose(ldbst_self->ldbst_fp)) return DSK_ERR_SYSERR;
	return DSK_ERR_OK;
}

	

