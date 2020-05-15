################################################################################
#
# openocd-zephyr
#
################################################################################

OPENOCD_ZEPHYR_VERSION = a0e8edc4e70b2bc35de57f44717a289d9e651f6f
OPENOCD_ZEPHYR_SITE = git://github.com/zephyrproject-rtos/openocd.git
OPENOCD_ZEPHYR_GIT_SUBMODULES = YES

OPENOCD_ZEPHYR_AUTORECONF = YES
OPENOCD_ZEPHYR_DEPENDENCIES = libusb-compat
OPENOCD_ZEPHYR_DEPENDENCIES += libftdi
OPENOCD_ZEPHYR_DEPENDENCIES += hidapi

OPENOCD_ZEPHYR_CONF_OPTS += --prefix=/usr/local/zephyr/openocd
OPENOCD_ZEPHYR_CONF_OPTS += --enable-ftdi
OPENOCD_ZEPHYR_CONF_OPTS += --disable-doxygen-html
OPENOCD_ZEPHYR_CONF_OPTS += --enable-cmsis-dap
OPENOCD_ZEPHYR_CONF_OPTS += --enable-jlink
OPENOCD_ZEPHYR_CONF_OPTS += --enable-stlink
OPENOCD_ZEPHYR_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_ZEPHYR_CONF_OPTS += --with-jim-shared=no
OPENOCD_ZEPHYR_CONF_OPTS += --disable-shared
OPENOCD_ZEPHYR_CONF_OPTS += --enable-dummy
OPENOCD_ZEPHYR_CONF_OPTS += --disable-werror

define OPENOCD_ZEPHYR_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_ZEPHYR_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_zephyr
endef


OPENOCD_ZEPHYR_PRE_PATCH_HOOKS += OPENOCD_ZEPHYR_BOOTSTRAP
OPENOCD_ZEPHYR_POST_INSTALL_TARGET_HOOKS += OPENOCD_ZEPHYR_TARGET_RENAME

$(eval $(autotools-package))
