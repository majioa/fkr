# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     Debug
#     Debug_clean

# Define ADI_DSP if it is not already defined.  Define this variable if you
# wish to run this Makefile on a host other than the host that created
# it and VisualDSP++ may be installed in a different directory.

ifndef ADI_DSP
ADI_DSP=C:\Program Files\Analog Devices\VisualDSP
endif

# $VDSP is a gmake-friendly version of ADI_DIR

empty:=
space:= $(empty) $(empty)
VDSP_INTERMEDIATE=$(subst \,/,$(ADI_DSP))
VDSP=$(subst $(space),\$(space),$(VDSP_INTERMEDIATE))

# Define the command to use to delete files (which is different on Win95/98
# and Windows NT/2000)

ifeq ($(OS),Windows_NT)
RM=cmd /C del /F /Q
else
RM=command /C del
endif

#
# Begin "Debug" configuration
#

ifeq ($(MAKECMDGOALS),Debug)

Debug : ./debug/fkr.dxe 

./debug/fkr.doj :./fkr.asm 
	$(VDSP)/easm218x.exe -proc ADSP-2185  -o .\Debug\fkr.doj -g .\fkr.asm -MM

./debug/fkr.dxe :./adsp-2185.ldf ./debug/fkr.doj 
	$(VDSP)/cc218x.exe .\Debug\fkr.doj -T .\ADSP-2185.ldf -proc ADSP-2185 -L .\Debug -flags-link -od,.\Debug -o .\Debug\fkr.dxe -flags-link -MM

endif

ifeq ($(MAKECMDGOALS),Debug_clean)

Debug_clean:
	$(RM) ".\Debug\fkr.doj"
	$(RM) ".\Debug\fkr.dxe"
	$(RM) ".\Debug\*.ipa"
	$(RM) ".\Debug\*.opa"
	$(RM) ".\Debug\*.ti"

endif


