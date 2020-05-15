################################################################################
#
# openocd-nrf9160
#
################################################################################

OPENOCD_NRF9160_VERSION = 769278ba01e8784b3fd7a2d87d5663f561dc17ce
OPENOCD_NRF9160_SITE = git://github.com/linino/openocd-nrf9160
OPENOCD_NRF9160_GIT_SUBMODULES = YES

OPENOCD_NRF9160_AUTORECONF = YES
OPENOCD_NRF9160_DEPENDENCIES = libusb-compat
OPENOCD_NRF9160_DEPENDENCIES += libftdi

OPENOCD_NRF9160_CONF_OPTS += --prefix=/usr/local/nrf9160/openocd
OPENOCD_NRF9160_CONF_OPTS += --enable-ftdi
OPENOCD_NRF9160_CONF_OPTS += --disable-doxygen-html
OPENOCD_NRF9160_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_NRF9160_CONF_OPTS += --with-jim-shared=no
OPENOCD_NRF9160_CONF_OPTS += --disable-shared
OPENOCD_NRF9160_CONF_OPTS += --enable-dummy
OPENOCD_NRF9160_CONF_OPTS += --disable-werror

define OPENOCD_NRF9160_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_NRF9160_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_nrf9160
endef


OPENOCD_NRF9160_PRE_PATCH_HOOKS += OPENOCD_NRF9160_BOOTSTRAP
OPENOCD_NRF9160_POST_INSTALL_TARGET_HOOKS += OPENOCD_NRF9160_TARGET_RENAME

$(eval $(autotools-package))
