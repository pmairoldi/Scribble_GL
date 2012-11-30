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
	${OBJECTDIR}/NetworkConnection.o \
	${OBJECTDIR}/InputData.o \
	${OBJECTDIR}/Point.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/RequestMessage.o \
	${OBJECTDIR}/Painter.o \
	${OBJECTDIR}/Color.o \
	${OBJECTDIR}/ScreenInterpreter.o \
	${OBJECTDIR}/PalmRejection.o \
	${OBJECTDIR}/Menu.o \
	${OBJECTDIR}/Path.o \
	${OBJECTDIR}/NetworkClient.o \
	${OBJECTDIR}/ScreenAreas.o \
	${OBJECTDIR}/Sender.o \
	${OBJECTDIR}/ScribbleArea.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-lglut -lGL -lGLU -lboost_thread-mt -lboost_system-mt -lboost_program_options-mt
CXXFLAGS=-lglut -lGL -lGLU -lboost_thread-mt -lboost_system-mt -lboost_program_options-mt

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl_working_copy

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl_working_copy: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl_working_copy ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/NetworkConnection.o: NetworkConnection.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/NetworkConnection.o NetworkConnection.cpp

${OBJECTDIR}/InputData.o: InputData.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/InputData.o InputData.cpp

${OBJECTDIR}/Point.o: Point.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Point.o Point.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/RequestMessage.o: RequestMessage.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/RequestMessage.o RequestMessage.cpp

${OBJECTDIR}/Painter.o: Painter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Painter.o Painter.cpp

${OBJECTDIR}/Color.o: Color.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Color.o Color.cpp

${OBJECTDIR}/ScreenInterpreter.o: ScreenInterpreter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScreenInterpreter.o ScreenInterpreter.cpp

${OBJECTDIR}/PalmRejection.o: PalmRejection.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/PalmRejection.o PalmRejection.cpp

${OBJECTDIR}/Menu.o: Menu.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Menu.o Menu.cpp

${OBJECTDIR}/Path.o: Path.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Path.o Path.cpp

${OBJECTDIR}/NetworkClient.o: NetworkClient.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/NetworkClient.o NetworkClient.cpp

${OBJECTDIR}/ScreenAreas.o: ScreenAreas.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScreenAreas.o ScreenAreas.cpp

${OBJECTDIR}/Sender.o: Sender.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/Sender.o Sender.cpp

${OBJECTDIR}/ScribbleArea.o: ScribbleArea.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(COMPILE.cc) -O2 -I. -I/usr/local/lib -MMD -MP -MF $@.d -o ${OBJECTDIR}/ScribbleArea.o ScribbleArea.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/scribble_gl_working_copy

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
