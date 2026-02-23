# Microsoft Visual C++ generated build script - Do not modify

PROJ = LIBDSK
DEBUG = 0
PROGTYPE = 4
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = J:\C\LIBDSK\DOS16VC1\
USEMFC = 1
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = BLAST.C     
FIRSTCPP =             
RC = rc
CFLAGS_D_LIB = /nologo /G2 /W3 /Z7 /AH /Od /D "_DEBUG" /D "__MSDOS__" /D "DOS16FLOPPY" /I "../dos16vc1" /I "../include" /FR /GA 
CFLAGS_R_LIB = /nologo /Gs /W3 /AH /Ox /D "NDEBUG" /D "__MSDOS__" /D "DOS16FLOPPY" /I "../dos16vc1" /I "../include" /FR /GA 
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_LIB)
LFLAGS = 
LIBS = 
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_LIB)
LFLAGS = 
LIBS = 
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = BLAST.SBR \
		COMPBZ2.SBR \
		COMPDSKF.SBR \
		COMPGZ.SBR \
		COMPQRST.SBR \
		COMPRESS.SBR \
		COMPSQ.SBR \
		COMPTLZH.SBR \
		CRC16.SBR \
		CRCTABLE.SBR \
		DRVADISK.SBR \
		DRVCFI.SBR \
		DRVCPCEM.SBR \
		DRVDC42.SBR \
		DRVDOS16.SBR \
		DRVDSKF.SBR \
		DRVGOTEK.SBR \
		DRVIMD.SBR \
		DRVINT25.SBR \
		DRVJV3.SBR \
		DRVLDBS.SBR \
		DRVLDBST.SBR \
		DRVLOGI.SBR \
		DRVMYZ80.SBR \
		DRVNTWDM.SBR \
		DRVNWASP.SBR \
		DRVPOSIX.SBR \
		DRVQM.SBR \
		DRVQRST.SBR \
		DRVRCPM.SBR \
		DRVSAP.SBR \
		DRVSIMH.SBR \
		DRVTELE.SBR \
		DRVYDSK.SBR \
		DSKCHECK.SBR \
		DSKCMT.SBR \
		DSKCOPY.SBR \
		DSKDIRTY.SBR \
		DSKERROR.SBR \
		DSKFMT.SBR \
		DSKGEOM.SBR \
		DSKICONV.SBR \
		DSKJNI.SBR \
		DSKLPHYS.SBR \
		DSKOPEN.SBR \
		DSKPARS.SBR \
		DSKREAD.SBR \
		DSKREPRT.SBR \
		DSKRETRY.SBR \
		DSKRTRD.SBR \
		DSKSECID.SBR \
		DSKSEEK.SBR \
		DSKSGEOM.SBR \
		DSKSTAT.SBR \
		DSKTREAD.SBR \
		DSKTRKID.SBR \
		DSKWRITE.SBR \
		LDBS.SBR \
		LDBS2TXT.SBR \
		REMOTE.SBR \
		TXT2LDBS.SBR \
		RPCCLI.SBR \
		RPCPACK.SBR \
		RPCFOSSL.SBR \
		INT25.SBR


BLAST_DEP = j:\c\libdsk\lib\blast.h


COMPBZ2_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\compbz2.h


COMPDSKF_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\compdskf.h


COMPGZ_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\compgz.h


COMPQRST_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\compqrst.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\blast.h


COMPRESS_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\comp.h \
	j:\c\libdsk\lib\compsq.h \
	j:\c\libdsk\lib\compgz.h \
	j:\c\libdsk\lib\compbz2.h \
	j:\c\libdsk\lib\compdskf.h \
	j:\c\libdsk\lib\comptlzh.h \
	j:\c\libdsk\lib\compqrst.h \
	j:\c\libdsk\lib\compress.inc


COMPSQ_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\compsq.h


COMPTLZH_DEP = j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\comptlzh.h


CRC16_DEP = j:\c\libdsk\lib\crc16.h


CRCTABLE_DEP = 

DRVADISK_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvadisk.h


DRVCFI_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvcfi.h


DRVCPCEM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvcpcem.h


DRVDC42_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvdc42.h


DRVDOS16_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvdos16.h


DRVDSKF_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvdskf.h


DRVGOTEK_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvgotek.h \
	j:\c\libdsk\lib\drvwin32.h


DRVIMD_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvimd.h


DRVINT25_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvint25.h \
	sys/farptr.h


DRVJV3_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvjv3.h


DRVLDBS_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h


DRVLDBST_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvldbst.h


DRVLOGI_DEP = j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvlogi.h


DRVMYZ80_DEP = j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvmyz80.h


DRVNTWDM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvntwdm.h


DRVNWASP_DEP = j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvnwasp.h


DRVPOSIX_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvposix.h


DRVQM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvqm.h \
	j:\c\libdsk\lib\crctable.h


DRVQRST_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvqrst.h


DRVRCPM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvrcpm.h


DRVSAP_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvsap.h


DRVSIMH_DEP = j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvsimh.h


DRVTELE_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvldbs.h \
	j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvtele.h


DRVYDSK_DEP = j:\c\libdsk\lib\ldbs.h \
	j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drvydsk.h


DSKCHECK_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKCMT_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKCOPY_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\ldbs.h


DSKDIRTY_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKERROR_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKFMT_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h


DSKGEOM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKICONV_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKLPHYS_DEP = j:\c\libdsk\lib\drvi.h


DSKLPHYS_DEP = j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKOPEN_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\drivers.h \
	j:\c\libdsk\lib\compress.h \
	j:\c\libdsk\lib\drivers.inc


DSKPARS_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKREAD_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKREPRT_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKRETRY_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKRTRD_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKSECID_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKSEEK_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKSGEOM_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKSTAT_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h


DSKTREAD_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKTRKID_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h


DSKWRITE_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\compi.h \
	j:\c\libdsk\lib\compress.h


LDBS_DEP = j:\c\libdsk\lib\ldbs.h


LDBS2TXT_DEP = j:\c\libdsk\lib\ldbs.h


REMOTE_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\rpcfuncs.h \
	j:\c\libdsk\lib\remote.h \
	j:\c\libdsk\lib\remall.h \
	j:\c\libdsk\lib\rpctios.h \
	j:\c\libdsk\lib\rpcwin32.h \
	j:\c\libdsk\lib\rpcfossl.h \
	j:\c\libdsk\lib\rpcfork.h \
	j:\c\libdsk\lib\remote.inc


TXT2LDBS_DEP = j:\c\libdsk\lib\ldbs.h


RPCCLI_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\rpcfuncs.h \
	j:\c\libdsk\lib\remote.h


RPCPACK_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\rpcfuncs.h


RPCFOSSL_DEP = j:\c\libdsk\lib\drvi.h \
	j:\c\libdsk\lib\drv.h \
	linux/fd.h \
	linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib\remote.h \
	j:\c\libdsk\lib\rpcfossl.h \
	j:\c\libdsk\lib\crc16.h \
	sys/farptr.h


all:	$(PROJ).LIB $(PROJ).BSC

BLAST.OBJ:	..\LIB\BLAST.C $(BLAST_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c ..\LIB\BLAST.C

COMPBZ2.OBJ:	..\LIB\COMPBZ2.C $(COMPBZ2_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPBZ2.C

COMPDSKF.OBJ:	..\LIB\COMPDSKF.C $(COMPDSKF_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPDSKF.C

COMPGZ.OBJ:	..\LIB\COMPGZ.C $(COMPGZ_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPGZ.C

COMPQRST.OBJ:	..\LIB\COMPQRST.C $(COMPQRST_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPQRST.C

COMPRESS.OBJ:	..\LIB\COMPRESS.C $(COMPRESS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPRESS.C

COMPSQ.OBJ:	..\LIB\COMPSQ.C $(COMPSQ_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPSQ.C

COMPTLZH.OBJ:	..\LIB\COMPTLZH.C $(COMPTLZH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\COMPTLZH.C

CRC16.OBJ:	..\LIB\CRC16.C $(CRC16_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\CRC16.C

CRCTABLE.OBJ:	..\LIB\CRCTABLE.C $(CRCTABLE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\CRCTABLE.C

DRVADISK.OBJ:	..\LIB\DRVADISK.C $(DRVADISK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVADISK.C

DRVCFI.OBJ:	..\LIB\DRVCFI.C $(DRVCFI_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVCFI.C

DRVCPCEM.OBJ:	..\LIB\DRVCPCEM.C $(DRVCPCEM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVCPCEM.C

DRVDC42.OBJ:	..\LIB\DRVDC42.C $(DRVDC42_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVDC42.C

DRVDOS16.OBJ:	..\LIB\DRVDOS16.C $(DRVDOS16_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVDOS16.C

DRVDSKF.OBJ:	..\LIB\DRVDSKF.C $(DRVDSKF_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVDSKF.C

DRVGOTEK.OBJ:	..\LIB\DRVGOTEK.C $(DRVGOTEK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVGOTEK.C

DRVIMD.OBJ:	..\LIB\DRVIMD.C $(DRVIMD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVIMD.C

DRVINT25.OBJ:	..\LIB\DRVINT25.C $(DRVINT25_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVINT25.C

DRVJV3.OBJ:	..\LIB\DRVJV3.C $(DRVJV3_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVJV3.C

DRVLDBS.OBJ:	..\LIB\DRVLDBS.C $(DRVLDBS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVLDBS.C

DRVLDBST.OBJ:	..\LIB\DRVLDBST.C $(DRVLDBST_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVLDBST.C

DRVLOGI.OBJ:	..\LIB\DRVLOGI.C $(DRVLOGI_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVLOGI.C

DRVMYZ80.OBJ:	..\LIB\DRVMYZ80.C $(DRVMYZ80_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVMYZ80.C

DRVNTWDM.OBJ:	..\LIB\DRVNTWDM.C $(DRVNTWDM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVNTWDM.C

DRVNWASP.OBJ:	..\LIB\DRVNWASP.C $(DRVNWASP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVNWASP.C

DRVPOSIX.OBJ:	..\LIB\DRVPOSIX.C $(DRVPOSIX_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVPOSIX.C

DRVQM.OBJ:	..\LIB\DRVQM.C $(DRVQM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVQM.C

DRVQRST.OBJ:	..\LIB\DRVQRST.C $(DRVQRST_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVQRST.C

DRVRCPM.OBJ:	..\LIB\DRVRCPM.C $(DRVRCPM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVRCPM.C

DRVSAP.OBJ:	..\LIB\DRVSAP.C $(DRVSAP_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVSAP.C

DRVSIMH.OBJ:	..\LIB\DRVSIMH.C $(DRVSIMH_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVSIMH.C

DRVTELE.OBJ:	..\LIB\DRVTELE.C $(DRVTELE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVTELE.C

DRVYDSK.OBJ:	..\LIB\DRVYDSK.C $(DRVYDSK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DRVYDSK.C

DSKCHECK.OBJ:	..\LIB\DSKCHECK.C $(DSKCHECK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKCHECK.C

DSKCMT.OBJ:	..\LIB\DSKCMT.C $(DSKCMT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKCMT.C

DSKCOPY.OBJ:	..\LIB\DSKCOPY.C $(DSKCOPY_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKCOPY.C

DSKDIRTY.OBJ:	..\LIB\DSKDIRTY.C $(DSKDIRTY_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKDIRTY.C

DSKERROR.OBJ:	..\LIB\DSKERROR.C $(DSKERROR_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKERROR.C

DSKFMT.OBJ:	..\LIB\DSKFMT.C $(DSKFMT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKFMT.C

DSKGEOM.OBJ:	..\LIB\DSKGEOM.C $(DSKGEOM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKGEOM.C

DSKICONV.OBJ:	..\LIB\DSKICONV.C $(DSKICONV_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKICONV.C

DSKJNI.OBJ:	..\LIB\DSKJNI.C $(DSKJNI_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKJNI.C

DSKLPHYS.OBJ:	..\LIB\DSKLPHYS.C $(DSKLPHYS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKLPHYS.C

DSKOPEN.OBJ:	..\LIB\DSKOPEN.C $(DSKOPEN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKOPEN.C

DSKPARS.OBJ:	..\LIB\DSKPARS.C $(DSKPARS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKPARS.C

DSKREAD.OBJ:	..\LIB\DSKREAD.C $(DSKREAD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKREAD.C

DSKREPRT.OBJ:	..\LIB\DSKREPRT.C $(DSKREPRT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKREPRT.C

DSKRETRY.OBJ:	..\LIB\DSKRETRY.C $(DSKRETRY_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKRETRY.C

DSKRTRD.OBJ:	..\LIB\DSKRTRD.C $(DSKRTRD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKRTRD.C

DSKSECID.OBJ:	..\LIB\DSKSECID.C $(DSKSECID_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKSECID.C

DSKSEEK.OBJ:	..\LIB\DSKSEEK.C $(DSKSEEK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKSEEK.C

DSKSGEOM.OBJ:	..\LIB\DSKSGEOM.C $(DSKSGEOM_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKSGEOM.C

DSKSTAT.OBJ:	..\LIB\DSKSTAT.C $(DSKSTAT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKSTAT.C

DSKTREAD.OBJ:	..\LIB\DSKTREAD.C $(DSKTREAD_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKTREAD.C

DSKTRKID.OBJ:	..\LIB\DSKTRKID.C $(DSKTRKID_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKTRKID.C

DSKWRITE.OBJ:	..\LIB\DSKWRITE.C $(DSKWRITE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\DSKWRITE.C

LDBS.OBJ:	..\LIB\LDBS.C $(LDBS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\LDBS.C

LDBS2TXT.OBJ:	..\LIB\LDBS2TXT.C $(LDBS2TXT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\LDBS2TXT.C

REMOTE.OBJ:	..\LIB\REMOTE.C $(REMOTE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\REMOTE.C

TXT2LDBS.OBJ:	..\LIB\TXT2LDBS.C $(TXT2LDBS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\TXT2LDBS.C

RPCCLI.OBJ:	..\LIB\RPCCLI.C $(RPCCLI_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\RPCCLI.C

RPCPACK.OBJ:	..\LIB\RPCPACK.C $(RPCPACK_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\RPCPACK.C

RPCFOSSL.OBJ:	..\LIB\RPCFOSSL.C $(RPCFOSSL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\LIB\RPCFOSSL.C

INT25.OBJ:	INT25.C $(INT25_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INT25.C

$(PROJ).LIB::	BLAST.OBJ COMPBZ2.OBJ COMPDSKF.OBJ COMPGZ.OBJ COMPQRST.OBJ COMPRESS.OBJ \
	COMPSQ.OBJ COMPTLZH.OBJ CRC16.OBJ CRCTABLE.OBJ DRVADISK.OBJ DRVCFI.OBJ DRVCPCEM.OBJ \
	DRVDC42.OBJ DRVDOS16.OBJ DRVDSKF.OBJ DRVGOTEK.OBJ DRVIMD.OBJ DRVINT25.OBJ DRVJV3.OBJ \
	DRVLDBS.OBJ DRVLDBST.OBJ DRVLOGI.OBJ DRVMYZ80.OBJ DRVNTWDM.OBJ DRVNWASP.OBJ DRVPOSIX.OBJ \
	DRVQM.OBJ DRVQRST.OBJ DRVRCPM.OBJ DRVSAP.OBJ DRVSIMH.OBJ DRVTELE.OBJ DRVYDSK.OBJ \
	DSKCHECK.OBJ DSKCMT.OBJ DSKCOPY.OBJ DSKDIRTY.OBJ DSKERROR.OBJ DSKFMT.OBJ DSKGEOM.OBJ \
	DSKICONV.OBJ DSKJNI.OBJ DSKLPHYS.OBJ DSKOPEN.OBJ DSKPARS.OBJ DSKREAD.OBJ DSKREPRT.OBJ \
	DSKRETRY.OBJ DSKRTRD.OBJ DSKSECID.OBJ DSKSEEK.OBJ DSKSGEOM.OBJ DSKSTAT.OBJ DSKTREAD.OBJ \
	DSKTRKID.OBJ DSKWRITE.OBJ LDBS.OBJ LDBS2TXT.OBJ REMOTE.OBJ TXT2LDBS.OBJ RPCCLI.OBJ \
	RPCPACK.OBJ RPCFOSSL.OBJ INT25.OBJ $(OBJS_EXT)
	echo >NUL @<<$(PROJ).CRF
$@ /PAGESIZE:64
y
+BLAST.OBJ &
+COMPBZ2.OBJ &
+COMPDSKF.OBJ &
+COMPGZ.OBJ &
+COMPQRST.OBJ &
+COMPRESS.OBJ &
+COMPSQ.OBJ &
+COMPTLZH.OBJ &
+CRC16.OBJ &
+CRCTABLE.OBJ &
+DRVADISK.OBJ &
+DRVCFI.OBJ &
+DRVCPCEM.OBJ &
+DRVDC42.OBJ &
+DRVDOS16.OBJ &
+DRVDSKF.OBJ &
+DRVGOTEK.OBJ &
+DRVIMD.OBJ &
+DRVINT25.OBJ &
+DRVJV3.OBJ &
+DRVLDBS.OBJ &
+DRVLDBST.OBJ &
+DRVLOGI.OBJ &
+DRVMYZ80.OBJ &
+DRVNTWDM.OBJ &
+DRVNWASP.OBJ &
+DRVPOSIX.OBJ &
+DRVQM.OBJ &
+DRVQRST.OBJ &
+DRVRCPM.OBJ &
+DRVSAP.OBJ &
+DRVSIMH.OBJ &
+DRVTELE.OBJ &
+DRVYDSK.OBJ &
+DSKCHECK.OBJ &
+DSKCMT.OBJ &
+DSKCOPY.OBJ &
+DSKDIRTY.OBJ &
+DSKERROR.OBJ &
+DSKFMT.OBJ &
+DSKGEOM.OBJ &
+DSKICONV.OBJ &
+DSKJNI.OBJ &
+DSKLPHYS.OBJ &
+DSKOPEN.OBJ &
+DSKPARS.OBJ &
+DSKREAD.OBJ &
+DSKREPRT.OBJ &
+DSKRETRY.OBJ &
+DSKRTRD.OBJ &
+DSKSECID.OBJ &
+DSKSEEK.OBJ &
+DSKSGEOM.OBJ &
+DSKSTAT.OBJ &
+DSKTREAD.OBJ &
+DSKTRKID.OBJ &
+DSKWRITE.OBJ &
+LDBS.OBJ &
+LDBS2TXT.OBJ &
+REMOTE.OBJ &
+TXT2LDBS.OBJ &
+RPCCLI.OBJ &
+RPCPACK.OBJ &
+RPCFOSSL.OBJ &
+INT25.OBJ &
;
<<
	if exist $@ del $@
	lib @$(PROJ).CRF

$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
