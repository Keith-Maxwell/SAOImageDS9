# tclzipfsConfig.sh --
#
# This shell script (for sh) is generated automatically by tclzipfs's
# configure script.  It will create shell variables for most of
# the configuration options discovered by the configure script.
# This script is intended to be included by the configure scripts
# for tclzipfs extensions so that they don't have to figure this all
# out for themselves.  This file does not duplicate information
# already provided by tclConfig.sh, so you may need to use that
# file in addition to this one.
#
# The information in this file is specific to a single platform.

# tclzipfs's version number.
tclzipfs_VERSION='1.0'

# The name of the tclzipfs library (may be either a .a file or a shared library):
tclzipfs_LIB_FILE=libtclzipfs1.0.a

# String to pass to linker to pick up the tclzipfs library from its
# build directory.
tclzipfs_BUILD_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclzipfs -ltclzipfs1.0'

# String to pass to linker to pick up the tclzipfs library from its
# installed directory.
tclzipfs_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclzipfs1.0 -ltclzipfs1.0'

# The name of the tclzipfs stub library (a .a file):
#tclzipfs_STUB_LIB_FILE=libtclzipfsstub1.0.a

# String to pass to linker to pick up the tclzipfs stub library from its
# build directory.
#tclzipfs_BUILD_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/tclzipfs -ltclzipfsstub1.0'

# String to pass to linker to pick up the tclzipfs stub library from its
# installed directory.
#tclzipfs_STUB_LIB_SPEC='-L/home/max/Programming/SAOImageDS9/lib/tclzipfs1.0 -ltclzipfsstub1.0'

# String to pass to linker to pick up the tclzipfs stub library from its
# build directory.
#tclzipfs_BUILD_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/tclzipfs/libtclzipfsstub1.0.a'

# String to pass to linker to pick up the tclzipfs stub library from its
# installed directory.
#tclzipfs_STUB_LIB_PATH='/home/max/Programming/SAOImageDS9/lib/tclzipfs1.0/libtclzipfsstub1.0.a'
