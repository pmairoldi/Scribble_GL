#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/SizePicker.o \
	${OBJECTDIR}/Alert.o \
	${OBJECTDIR}/InputData.o \
	${OBJECTDIR}/Point.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/AlertButton.o \
	${OBJECTDIR}/Painter.o \
	${OBJECTDIR}/RequestMessage.o \
	${OBJECTDIR}/Document.o \
	${OBJECTDIR}/FileListCell.o \
	${OBJECTDIR}/ColorPicker.o \
	${OBJECTDIR}/Button.o \
	${OBJECTDIR}/Color.o \
	${OBJECTDIR}/Login.o \
	${OBJECTDIR}/ScreenInterpreter.o \
	${OBJECTDIR}/PalmRejection.o \
	${OBJECTDIR}/Menu.o \
	${OBJECTDIR}/FileListButton.o \
	${OBJECTDIR}/Keyboard.o \
	${OBJECTDIR}/MenuButton.o \
	${OBJECTDIR}/Path.o \
	${OBJECTDIR}/Picker.o \
	${OBJECTDIR}/FileList.o \
	${OBJECTDIR}/lodepng.o \
	${OBJECTDIR}/LoginButton.o \
	${OBJECTDIR}/NetworkClient.o \
	${OBJECTDIR}/ScreenAreas.o \
	${OBJECTDIR}/Sender.o \
	${OBJECTDIR}/ScribbleArea.o \
	${OBJECTDIR}/Loading.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-lglut -lGLU -lboost_thread-mt -lboost_system-mt -lboost_program_options-mt -lpoppler-cpp -lpoppler -lftgl -std=gnu++0x
CXXFLAGS=-lglut -lGLU -lboost_thread-mt -lboost_system-mt -lboost_program_options-mt -lpoppler-cpp -lpoppler -lftgl -std=gnu++0x

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/SizePicker.o: SizePicker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/SizePicker.o SizePicker.cpp

${OBJECTDIR}/Alert.o: Alert.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Alert.o Alert.cpp

${OBJECTDIR}/InputData.o: InputData.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/InputData.o InputData.cpp

${OBJECTDIR}/Point.o: Point.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Point.o Point.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/AlertButton.o: AlertButton.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/AlertButton.o AlertButton.cpp

${OBJECTDIR}/Painter.o: Painter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Painter.o Painter.cpp

${OBJECTDIR}/RequestMessage.o: RequestMessage.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/RequestMessage.o RequestMessage.cpp

${OBJECTDIR}/Document.o: Document.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Document.o Document.cpp

${OBJECTDIR}/FileListCell.o: FileListCell.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/FileListCell.o FileListCell.cpp

${OBJECTDIR}/ColorPicker.o: ColorPicker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/ColorPicker.o ColorPicker.cpp

${OBJECTDIR}/Button.o: Button.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Button.o Button.cpp

${OBJECTDIR}/Color.o: Color.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Color.o Color.cpp

${OBJECTDIR}/Login.o: Login.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Login.o Login.cpp

${OBJECTDIR}/ScreenInterpreter.o: ScreenInterpreter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScreenInterpreter.o ScreenInterpreter.cpp

${OBJECTDIR}/PalmRejection.o: PalmRejection.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/PalmRejection.o PalmRejection.cpp

${OBJECTDIR}/Menu.o: Menu.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Menu.o Menu.cpp

${OBJECTDIR}/FileListButton.o: FileListButton.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/FileListButton.o FileListButton.cpp

${OBJECTDIR}/Keyboard.o: Keyboard.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Keyboard.o Keyboard.cpp

${OBJECTDIR}/MenuButton.o: MenuButton.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/MenuButton.o MenuButton.cpp

${OBJECTDIR}/Path.o: Path.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Path.o Path.cpp

${OBJECTDIR}/Picker.o: Picker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Picker.o Picker.cpp

${OBJECTDIR}/FileList.o: FileList.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/FileList.o FileList.cpp

${OBJECTDIR}/lodepng.o: lodepng.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/lodepng.o lodepng.cpp

${OBJECTDIR}/LoginButton.o: LoginButton.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/LoginButton.o LoginButton.cpp

${OBJECTDIR}/NetworkClient.o: NetworkClient.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/NetworkClient.o NetworkClient.cpp

${OBJECTDIR}/ScreenAreas.o: ScreenAreas.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScreenAreas.o ScreenAreas.cpp

${OBJECTDIR}/Sender.o: Sender.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Sender.o Sender.cpp

${OBJECTDIR}/ScribbleArea.o: ScribbleArea.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScribbleArea.o ScribbleArea.cpp

${OBJECTDIR}/Loading.o: Loading.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/include/freetype2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/Loading.o Loading.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
