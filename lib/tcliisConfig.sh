# tcliisConfig.sh --
#
# This shell script (for sh) is generated automatically by tcliis's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tcliis extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tcliis's version number.
tcliis_VERSION='1.0'

# The name of the tcliis library (may be either a .a file or a shared library):
tcliis_LIB_FILE=libtcliis1.0.a

# String to pass to linker to pick up the tcliis library from its
# build directory.
tcliis_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tcliis -ltcliis1.0'

# String to pass to linker to pick up the tcliis library from its
# installed directory.
tcliis_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tcliis1.0 -ltcliis1.0'

# The name of the tcliis stub library (a .a file):
#tcliis_STUB_LIB_FILE=libtcliisstub1.0.a

# String to pass to linker to pick up the tcliis stub library from its
# build directory.
#tcliis_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tcliis -ltcliisstub1.0'

# String to pass to linker to pick up the tcliis stub library from its
# installed directory.
#tcliis_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tcliis1.0 -ltcliisstub1.0'

# String to pass to linker to pick up the tcliis stub library from its
# build directory.
#tcliis_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tcliis/libtcliisstub1.0.a'

# String to pass to linker to pick up the tcliis stub library from its
# installed directory.
#tcliis_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tcliis1.0/libtcliisstub1.0.a'
