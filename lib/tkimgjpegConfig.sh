# tkimgjpegConfig.sh --
#
# This shell script (for sh) is generated automatically by tkimgjpeg's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tkimgjpeg extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tkimgjpeg's version number.
tkimgjpeg_VERSION='1.4.9'

# The name of the tkimgjpeg library (may be either a .a file or a shared library):
tkimgjpeg_LIB_FILE=libtkimgjpeg1.4.9.a

# String to pass to linker to pick up the tkimgjpeg library from its
# build directory.
tkimgjpeg_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tkimg/jpeg -ltkimgjpeg1.4.9'

# String to pass to linker to pick up the tkimgjpeg library from its
# installed directory.
tkimgjpeg_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tkimgjpeg1.4.9 -ltkimgjpeg1.4.9'
