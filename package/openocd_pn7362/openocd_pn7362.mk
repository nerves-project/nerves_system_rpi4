################################################################################
#
# openocd-pn7362
#
################################################################################

OPENOCD_PN7362_VERSION = v0.1.0
OPENOCD_PN7362_SITE = git://github.com/bcdevices/openocd_pn7362
OPENOCD_PN7362_GIT_SUBMODULES = YES

OPENOCD_PN7362_AUTORECONF = YES
OPENOCD_PN7362_DEPENDENCIES = libusb-compat
OPENOCD_PN7362_DEPENDENCIES += libftdi

OPENOCD_PN7362_CONF_OPTS += --prefix=/usr/local/pn7362/openocd
OPENOCD_PN7362_CONF_OPTS += --enable-ftdi
OPENOCD_PN7362_CONF_OPTS += --disable-doxygen-html
OPENOCD_PN7362_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_PN7362_CONF_OPTS += --with-jim-shared=no
OPENOCD_PN7362_CONF_OPTS += --disable-shared
OPENOCD_PN7362_CONF_OPTS += --enable-dummy
OPENOCD_PN7362_CONF_OPTS += --disable-werror

define OPENOCD_PN7362_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_PN7362_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_pn7362
endef


OPENOCD_PN7362_PRE_PATCH_HOOKS += OPENOCD_PN7362_BOOTSTRAP
OPENOCD_PN7362_POST_INSTALL_TARGET_HOOKS += OPENOCD_PN7362_TARGET_RENAME

$(eval $(autotools-package))
