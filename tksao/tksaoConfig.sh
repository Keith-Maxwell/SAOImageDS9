# tksaoConfig.sh --
#
# This shell script (for sh) is generated automatically by tksao's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tksao extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tksao's version number.
tksao_VERSION='1.0'

# The name of the tksao library (may be either a .a file or a shared library):
tksao_LIB_FILE=libtksao1.0.a

# String to pass to linker to pick up the tksao library from its
# build directory.
tksao_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tksao -ltksao1.0'

# String to pass to linker to pick up the tksao library from its
# installed directory.
tksao_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tksao1.0 -ltksao1.0'

# The name of the tksao stub library (a .a file):
#tksao_STUB_LIB_FILE=libtksaostub1.0.a

# String to pass to linker to pick up the tksao stub library from its
# build directory.
#tksao_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tksao -ltksaostub1.0'

# String to pass to linker to pick up the tksao stub library from its
# installed directory.
#tksao_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tksao1.0 -ltksaostub1.0'

# String to pass to linker to pick up the tksao stub library from its
# build directory.
#tksao_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tksao/libtksaostub1.0.a'

# String to pass to linker to pick up the tksao stub library from its
# installed directory.
#tksao_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tksao1.0/libtksaostub1.0.a'
