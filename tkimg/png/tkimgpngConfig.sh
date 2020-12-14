# tkimgpngConfig.sh --
#
# This shell script (for sh) is generated automatically by tkimgpng's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tkimgpng extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tkimgpng's version number.
tkimgpng_VERSION='1.4.9'

# The name of the tkimgpng library (may be either a .a file or a shared library):
tkimgpng_LIB_FILE=libtkimgpng1.4.9.a

# String to pass to linker to pick up the tkimgpng library from its
# build directory.
tkimgpng_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tkimg/png -ltkimgpng1.4.9'

# String to pass to linker to pick up the tkimgpng library from its
# installed directory.
tkimgpng_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tkimgpng1.4.9 -ltkimgpng1.4.9'
