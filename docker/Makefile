NAME = docker-engine
VERSION = 1.12.3
DEPENDS := iptables libcgroup device-mapper-libs sqlite tar xz
FPM_SOURCE = dir
SOURCE_URL = https://yum-amzn.uacf.io/main/2016.03/amzn-main/Packages/docker-1.11.2-1.6.amzn1.x86_64.rpm
SRC_TGZ = $(notdir $(SOURCE_URL))
PACKAGE_URL = https://docker.io/
PACKAGE_DESCRIPTION = The [sic] open-source application container engine

include ../include/base.mk

extract: fetch default_build
	cd $(BUILDDIR); rpm2cpio $(CACHEDIR)/$(SRC_TGZ) | cpio -idmv

# this only works in the context of a docker.image(...).inside(...) thingy that's set a MOUNT_DIR for us
build: extract
	cd $(BUILDDIR) \
		&& rm -fR $(BUILDDIR)/usr/share/man $(BUILDDIR)/usr/share/doc \
		&& cp $(MOUNT_DIR)/binaries/1.12.3/binary-client/* $(BUILDDIR)/usr/bin/ \
		&& cp $(MOUNT_DIR)/binaries/1.12.3/binary-daemon/* $(BUILDDIR)/usr/bin/ \
		&& mkdir -p $(DESTDIR) \
		&& cp -pR $(BUILDDIR)/* $(DESTDIR)
