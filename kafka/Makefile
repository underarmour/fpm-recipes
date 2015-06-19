NAME = kafka
VERSION = 0.8.2.1
DEPENDS := $(JAVA_PACKAGE)
FPM_SOURCE = dir
SOURCE_URL = http://mirrors.ibiblio.org/apache/kafka/$(VERSION)/kafka_2.10-$(VERSION).tgz
SRC_TGZ = $(notdir $(SOURCE_URL))
PACKAGE_URL = http://incubator.apache.org/kafka/index.html
PACKAGE_DESCRIPTION = Apache Kafka is a distributed publish-subscribe messaging system

include ../include/base.mk

extract: fetch default_build
	cd $(BUILDDIR); tar xzf $(CACHEDIR)/$(SRC_TGZ)

build: extract
	cd $(BUILDDIR)/kafka_2.10-$(VERSION) \
		&& mkdir -p $(DESTDIR)/usr/local \
		&& cp -pR $(BUILDDIR)/kafka_2.10-$(VERSION) $(DESTDIR)/usr/local/$(NAME)
