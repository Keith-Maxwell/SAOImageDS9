# utilConfig.sh --
#
# This shell script (for sh) is generated automatically by util's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for util extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# util's version number.
util_VERSION='1.0'

# The name of the util library (may be either a .a file or a shared library):
util_LIB_FILE=libutil1.0.a

# String to pass to linker to pick up the util library from its
# build directory.
util_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/util -lutil1.0'

# String to pass to linker to pick up the util library from its
# installed directory.
util_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/util1.0 -lutil1.0'

# The name of the util stub library (a .a file):
#util_STUB_LIB_FILE=libutilstub1.0.a

# String to pass to linker to pick up the util stub library from its
# build directory.
#util_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/util -lutilstub1.0'

# String to pass to linker to pick up the util stub library from its
# installed directory.
#util_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/util1.0 -lutilstub1.0'

# String to pass to linker to pick up the util stub library from its
# build directory.
#util_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/util/libutilstub1.0.a'

# String to pass to linker to pick up the util stub library from its
# installed directory.
#util_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/util1.0/libutilstub1.0.a'
