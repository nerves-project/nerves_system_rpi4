################################################################################
#
# pickle
#
################################################################################

PICKLE_VERSION = fbbf5e9d1fd1
PICKLE_SITE = http://hg.kewl.org/pub/pickle
PICKLE_SITE_METHOD = hg
PICKLE_LICENSE = GPL-3.0
PICKLE_LICENSE_FILES = pickle/COPYING
PICKLE_AUTORECONF = NO

ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
PICKLE_DEPENDENCIES += libftdi1
else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
PICKLE_DEPENDENCIES += libftdi
endif

define PICKLE_BUILD_CMDS
  CROSS_COMPILE=$(TARGET_CROSS) $(MAKE) CONFIG=config/linux.mk -C "$(@D)/src"
endef

define PICKLE_INSTALL_TARGET_CMDS
	  BINDIR="$(TARGET_DIR)/usr/bin/" $(MAKE) -C $(@D) install
endef


$(eval $(generic-package))
