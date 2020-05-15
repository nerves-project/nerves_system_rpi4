################################################################################
#
# openocd-cypress
#
################################################################################

OPENOCD_CYPRESS_VERSION = release-v3.0.0
OPENOCD_CYPRESS_SITE = git://github.com/cypresssemiconductorco/openocd.git
OPENOCD_CYPRESS_GIT_SUBMODULES = YES

OPENOCD_CYPRESS_AUTORECONF = YES
OPENOCD_CYPRESS_DEPENDENCIES = libusb-compat
OPENOCD_CYPRESS_DEPENDENCIES += libftdi
OPENOCD_CYPRESS_DEPENDENCIES += hidapi

OPENOCD_CYPRESS_CONF_OPTS += --prefix=/usr/local/cypress/openocd
OPENOCD_CYPRESS_CONF_OPTS += --enable-ftdi
OPENOCD_CYPRESS_CONF_OPTS += --disable-doxygen-html
OPENOCD_CYPRESS_CONF_OPTS += --enable-cmsis-dap
OPENOCD_CYPRESS_CONF_OPTS += --enable-jlink
OPENOCD_CYPRESS_CONF_OPTS += --enable-kitprog
OPENOCD_CYPRESS_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_CYPRESS_CONF_OPTS += --with-jim-shared=no
OPENOCD_CYPRESS_CONF_OPTS += --disable-shared
OPENOCD_CYPRESS_CONF_OPTS += --enable-dummy
OPENOCD_CYPRESS_CONF_OPTS += --disable-werror

define OPENOCD_CYPRESS_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_CYPRESS_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_cypress
endef


OPENOCD_CYPRESS_PRE_PATCH_HOOKS += OPENOCD_CYPRESS_BOOTSTRAP
OPENOCD_CYPRESS_POST_INSTALL_TARGET_HOOKS += OPENOCD_CYPRESS_TARGET_RENAME

$(eval $(autotools-package))
