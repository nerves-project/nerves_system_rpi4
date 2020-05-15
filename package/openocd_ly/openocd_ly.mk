################################################################################
#
# openocd-ly
#
################################################################################

OPENOCD_LY_VERSION = a4ac56152d9fc13c3fa479397407d9b86ffb13d8
OPENOCD_LY_SITE = git://github.com/ntfreak/openocd
OPENOCD_LY_GIT_SUBMODULES = YES

OPENOCD_LY_AUTORECONF = YES
OPENOCD_LY_DEPENDENCIES = libusb-compat
OPENOCD_LY_DEPENDENCIES += libftdi
OPENOCD_LY_DEPENDENCIES += hidapi

OPENOCD_LY_CONF_OPTS += --enable-ftdi
OPENOCD_LY_CONF_OPTS += --disable-doxygen-html
OPENOCD_LY_CONF_OPTS += --enable-cmsis-dap
OPENOCD_LY_CONF_OPTS += --enable-jlink
OPENOCD_LY_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_LY_CONF_OPTS += --with-jim-shared=no
OPENOCD_LY_CONF_OPTS += --disable-shared
OPENOCD_LY_CONF_OPTS += --enable-dummy
OPENOCD_LY_CONF_OPTS += --disable-werror

define OPENOCD_LY_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_ly
endef

OPENOCD_LY_POST_INSTALL_TARGET_HOOKS += OPENOCD_LY_TARGET_RENAME

$(eval $(autotools-package))
