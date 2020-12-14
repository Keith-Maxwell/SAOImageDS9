# vectorConfig.sh --
#
# This shell script (for sh) is generated automatically by vector's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for vector extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# vector's version number.
vector_VERSION='1.0'

# The name of the vector library (may be either a .a file or a shared library):
vector_LIB_FILE=libvector1.0.a

# String to pass to linker to pick up the vector library from its
# build directory.
vector_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/vector -lvector1.0'

# String to pass to linker to pick up the vector library from its
# installed directory.
vector_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/vector1.0 -lvector1.0'

# The name of the vector stub library (a .a file):
#vector_STUB_LIB_FILE=libvectorstub1.0.a

# String to pass to linker to pick up the vector stub library from its
# build directory.
#vector_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/vector -lvectorstub1.0'

# String to pass to linker to pick up the vector stub library from its
# installed directory.
#vector_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/vector1.0 -lvectorstub1.0'

# String to pass to linker to pick up the vector stub library from its
# build directory.
#vector_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/vector/libvectorstub1.0.a'

# String to pass to linker to pick up the vector stub library from its
# installed directory.
#vector_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/vector1.0/libvectorstub1.0.a'
