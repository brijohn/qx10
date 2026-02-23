# Microsoft Visual C++ generated build script - Do not modify

PROJ = DSKTRANS
DEBUG = 0
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = J:\C\LIBDSK\DOS16VC1\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = DSKTRANS.C  
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AH /Od /D "_DEBUG" /D "_DOS" /D "__MSDOS__" /D "DOS16FLOPPY" /I "..\dos16vc1" /I "..\include" /FR /Fd"DSKTRANS.PDB"
CFLAGS_R_DEXE = /nologo /Gs /W3 /AH /Ox /D "NDEBUG" /D "_DOS" /D "__MSDOS__" /D "DOS16FLOPPY" /I "..\dos16vc1" /I "..\include" /FR 
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames llibce libdsk 
LIBS_R_DEXE = oldnames llibce libdsk 
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_DEXE)
LFLAGS = $(LFLAGS_D_DEXE)
LIBS = $(LIBS_D_DEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_DEXE)
LFLAGS = $(LFLAGS_R_DEXE)
LIBS = $(LIBS_R_DEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = DSKTRANS.SBR \
		UTILOPTS.SBR \
		FORMNAME.SBR \
		BOOTSEC.SBR


DSKTRANS_DEP = j:\c\libdsk\tools\utilopts.h \
	j:\c\libdsk\tools\formname.h \
	j:\c\libdsk\tools\apriboot.h


UTILOPTS_DEP = j:\c\libdsk\tools\utilopts.h


FORMNAME_DEP = j:\c\libdsk\tools\utilopts.h


BOOTSEC_DEP = j:\c\libdsk\tools\apriboot.h


all:	$(PROJ).EXE $(PROJ).BSC

DSKTRANS.OBJ:	..\TOOLS\DSKTRANS.C $(DSKTRANS_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c ..\TOOLS\DSKTRANS.C

UTILOPTS.OBJ:	..\TOOLS\UTILOPTS.C $(UTILOPTS_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\TOOLS\UTILOPTS.C

FORMNAME.OBJ:	..\TOOLS\FORMNAME.C $(FORMNAME_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\TOOLS\FORMNAME.C

BOOTSEC.OBJ:	..\TOOLS\BOOTSEC.C $(BOOTSEC_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c ..\TOOLS\BOOTSEC.C

$(PROJ).EXE::	DSKTRANS.OBJ UTILOPTS.OBJ FORMNAME.OBJ BOOTSEC.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
DSKTRANS.OBJ +
UTILOPTS.OBJ +
FORMNAME.OBJ +
BOOTSEC.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
D:\USR\MSVC\LIB\+
D:\USR\MSVC\MFC\LIB\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
