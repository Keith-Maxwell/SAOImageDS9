# tkimgtiffConfig.sh --
#
# This shell script (for sh) is generated automatically by tkimgtiff's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tkimgtiff extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tkimgtiff's version number.
tkimgtiff_VERSION='1.4.9'

# The name of the tkimgtiff library (may be either a .a file or a shared library):
tkimgtiff_LIB_FILE=libtkimgtiff1.4.9.a

# String to pass to linker to pick up the tkimgtiff library from its
# build directory.
tkimgtiff_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tkimg/tiff -ltkimgtiff1.4.9'

# String to pass to linker to pick up the tkimgtiff library from its
# installed directory.
tkimgtiff_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tkimgtiff1.4.9 -ltkimgtiff1.4.9'
