NAME = docker-engine
VERSION = 1.12.3
DEPENDS := iptables libcgroup device-mapper-libs sqlite tar xz
FPM_SOURCE = dir
SOURCE_URL = https://github.com/docker/docker
SRC_TGZ = $(notdir $(SOURCE_URL))
PACKAGE_URL = https://docker.io/
PACKAGE_DESCRIPTION = The [sic] open-source application container engine

include ../include/base.mk

extract:
	cd $(BUILDDIR);

build: extract
	cd $(BUILDDIR) \
		&& rm -fR $(BUILDDIR)/etc/rc.d $(BUILDDIR)/usr/lib \
		&& mkdir -p $(DESTDIR) \
		&& cp -pR $(BUILDDIR)/* $(DESTDIR)
