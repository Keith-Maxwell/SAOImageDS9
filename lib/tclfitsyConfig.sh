# tclfitsyConfig.sh --
#
# This shell script (for sh) is generated automatically by tclfitsy's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tclfitsy extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tclfitsy's version number.
tclfitsy_VERSION='1.0'

# The name of the tclfitsy library (may be either a .a file or a shared library):
tclfitsy_LIB_FILE=libtclfitsy1.0.a

# String to pass to linker to pick up the tclfitsy library from its
# build directory.
tclfitsy_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclfitsy -ltclfitsy1.0'

# String to pass to linker to pick up the tclfitsy library from its
# installed directory.
tclfitsy_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclfitsy1.0 -ltclfitsy1.0'

# The name of the tclfitsy stub library (a .a file):
#tclfitsy_STUB_LIB_FILE=libtclfitsystub1.0.a

# String to pass to linker to pick up the tclfitsy stub library from its
# build directory.
#tclfitsy_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclfitsy -ltclfitsystub1.0'

# String to pass to linker to pick up the tclfitsy stub library from its
# installed directory.
#tclfitsy_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclfitsy1.0 -ltclfitsystub1.0'

# String to pass to linker to pick up the tclfitsy stub library from its
# build directory.
#tclfitsy_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tclfitsy/libtclfitsystub1.0.a'

# String to pass to linker to pick up the tclfitsy stub library from its
# installed directory.
#tclfitsy_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tclfitsy1.0/libtclfitsystub1.0.a'
