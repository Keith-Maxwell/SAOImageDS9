# tclxmlConfig.sh --
#
# This shell script (for sh) is generated automatically by tclxml's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tclxml extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tclxml's version number.
tclxml_VERSION='3.2'

# The name of the tclxml library (may be either a .a file or a shared library):
tclxml_LIB_FILE=libtclxml3.2.a

# String to pass to linker to pick up the tclxml library from its
# build directory.
tclxml_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclxml -ltclxml3.2'

# String to pass to linker to pick up the tclxml library from its
# installed directory.
tclxml_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclxml3.2 -ltclxml3.2'

# The name of the tclxml stub library (a .a file):
#tclxml_STUB_LIB_FILE=libtclxmlstub3.2.a

# String to pass to linker to pick up the tclxml stub library from its
# build directory.
#tclxml_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclxml -ltclxmlstub3.2'

# String to pass to linker to pick up the tclxml stub library from its
# installed directory.
#tclxml_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclxml3.2 -ltclxmlstub3.2'

# String to pass to linker to pick up the tclxml stub library from its
# build directory.
#tclxml_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tclxml/libtclxmlstub3.2.a'

# String to pass to linker to pick up the tclxml stub library from its
# installed directory.
#tclxml_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tclxml3.2/libtclxmlstub3.2.a'
