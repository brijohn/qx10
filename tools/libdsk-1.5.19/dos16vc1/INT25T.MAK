# Microsoft Visual C++ generated build script - Do not modify

PROJ = INT25T
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
FIRSTC =             
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AH /Od /D "_DEBUG" /D "_DOS" /D "__MSDOS__" /D "DOS16FLOPPY" /I "..\dos16vc1" /I "..\include" /FR /Fd"DSKID.PDB"
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
SBRS = INT25.SBR \
		INT25T.SBR


INT25_DEP = j:\c\libdsk\lib/drvi.h \
	j:\c\libdsk\dos16vc1\config.h \
	j:\c\libdsk\lib/\drv.h \
	j:\c\libdsk\dos16vc1\linux/fd.h \
	j:\c\libdsk\dos16vc1\linux/fdreg.h \
	sys/mkdev.h \
	sys/sysmacro.h \
	j:\c\libdsk\lib/drvint25.h


INT25T_DEP = 

all:	$(PROJ).EXE $(PROJ).BSC

INT25.OBJ:	INT25.C $(INT25_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INT25.C

INT25T.OBJ:	INT25T.C $(INT25T_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c INT25T.C

$(PROJ).EXE::	INT25.OBJ INT25T.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
INT25.OBJ +
INT25T.OBJ +
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
