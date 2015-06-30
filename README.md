FPM Recipes
===========

These are recipes for FPM in the form of GNU Makefiles. Have fun.

Requires the ruby gem FPM.  Requires rpmbuild for making RPMs and dpkg for making DEBs.  Probably best to be aware of which projects are safe to build on OSX versus their destination OSes, which is generally an issue of whether the project has native code extensions.

## Usage

`make` - will attempt to build a package
`make clean` - will delete downloads and intermediate files
`make distclean` - will delete intermediate files and any built packages
`make pkgclean` - will allow `make` to rebuild package w/o re-downloading

## Changelog
 - bumped Kafka and Zookeeper
 - build both RPMs and DEBs
 - reuse the downloaded file
 - added pkgclean because I couldn't figure out how to retrigger $(PKG_DIR):
