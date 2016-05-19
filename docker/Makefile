NAME = docker-engine
VERSION = 1.11.1
DEPENDS := iptables libcgroup device-mapper-libs sqlite tar xz
FPM_SOURCE = dir
SOURCE_URL = http://yum.dockerproject.org/repo/main/centos/7/Packages/docker-engine-$(VERSION)-1.el7.centos.x86_64.rpm
SRC_TGZ = $(notdir $(SOURCE_URL))
PACKAGE_URL = https://docker.io/
PACKAGE_DESCRIPTION = The [sic] open-source application container engine

include ../include/base.mk

extract: fetch default_build
	cd $(BUILDDIR); rpm2cpio $(CACHEDIR)/$(SRC_TGZ) | cpio -idmv

build: extract
	cd $(BUILDDIR) \
		&& rm -fR $(BUILDDIR)/etc/rc.d $(BUILDDIR)/usr/lib \
		&& mkdir -p $(DESTDIR) \
		&& cp -pR $(BUILDDIR)/* $(DESTDIR)
