# fitsyConfig.sh --
#
# This shell script (for sh) is generated automatically by fitsy's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for fitsy extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# fitsy's version number.
fitsy_VERSION='1.0'

# The name of the fitsy library (may be either a .a file or a shared library):
fitsy_LIB_FILE=libfitsy1.0.a

# String to pass to linker to pick up the fitsy library from its
# build directory.
fitsy_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/fitsy -lfitsy1.0'

# String to pass to linker to pick up the fitsy library from its
# installed directory.
fitsy_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/fitsy1.0 -lfitsy1.0'

# The name of the fitsy stub library (a .a file):
#fitsy_STUB_LIB_FILE=libfitsystub1.0.a

# String to pass to linker to pick up the fitsy stub library from its
# build directory.
#fitsy_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/fitsy -lfitsystub1.0'

# String to pass to linker to pick up the fitsy stub library from its
# installed directory.
#fitsy_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/fitsy1.0 -lfitsystub1.0'

# String to pass to linker to pick up the fitsy stub library from its
# build directory.
#fitsy_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/fitsy/libfitsystub1.0.a'

# String to pass to linker to pick up the fitsy stub library from its
# installed directory.
#fitsy_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/fitsy1.0/libfitsystub1.0.a'
