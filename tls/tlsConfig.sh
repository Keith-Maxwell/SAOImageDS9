# tlsConfig.sh --
#
# This shell script (for sh) is generated automatically by tls's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tls extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tls's version number.
tls_VERSION='1.6.7'

# The name of the tls library (may be either a .a file or a shared library):
tls_LIB_FILE=libtls1.6.7.a

# String to pass to linker to pick up the tls library from its
# build directory.
tls_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tls -ltls1.6.7'

# String to pass to linker to pick up the tls library from its
# installed directory.
tls_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tls1.6.7 -ltls1.6.7'

# The name of the tls stub library (a .a file):
#tls_STUB_LIB_FILE=libtlsstub1.6.7.a

# String to pass to linker to pick up the tls stub library from its
# build directory.
#tls_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tls -ltlsstub1.6.7'

# String to pass to linker to pick up the tls stub library from its
# installed directory.
#tls_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tls1.6.7 -ltlsstub1.6.7'

# String to pass to linker to pick up the tls stub library from its
# build directory.
#tls_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tls/libtlsstub1.6.7.a'

# String to pass to linker to pick up the tls stub library from its
# installed directory.
#tls_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tls1.6.7/libtlsstub1.6.7.a'
