################################################################################
#
# openocd-esp32
#
################################################################################

OPENOCD_ESP32_VERSION = v0.10.0-esp32-20180418
OPENOCD_ESP32_SOURCE = v$(OPENOCD_ESP32_VERSION).tar.gz
OPENOCD_ESP32_SITE = git://github.com/espressif/openocd-esp32
OPENOCD_ESP32_GIT_SUBMODULES = YES

OPENOCD_ESP32_DEPENDENCIES = libusb-compat
OPENOCD_ESP32_DEPENDENCIES += libftdi

OPENOCD_ESP32_CONF_OPTS += --prefix=/usr/local/esp/openocd
OPENOCD_ESP32_CONF_OPTS += --enable-ftdi
OPENOCD_ESP32_CONF_OPTS += --disable-doxygen-html
OPENOCD_ESP32_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_ESP32_CONF_OPTS += --with-jim-shared=no
OPENOCD_ESP32_CONF_OPTS += --disable-shared
OPENOCD_ESP32_CONF_OPTS += --enable-dummy
OPENOCD_ESP32_CONF_OPTS += --disable-werror

define OPENOCD_ESP32_BOOTSTRAP
	(cd $(@D); $(TARGET_MAKE_ENV) ./bootstrap nosubmodule)
	mkdir $(@D)/m4
endef

define OPENOCD_ESP32_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_esp32
endef


OPENOCD_ESP32_PRE_CONFIGURE_HOOKS += OPENOCD_ESP32_BOOTSTRAP
OPENOCD_ESP32_POST_INSTALL_TARGET_HOOKS += OPENOCD_ESP32_TARGET_RENAME

$(eval $(autotools-package))
