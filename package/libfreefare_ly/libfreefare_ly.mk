################################################################################
#
# libfreefare-ly
#
################################################################################
LIBFREEFARE_LY_VERSION = 5459806659d5f6aa0e7705b88c48775ea6c861a6
LIBFREEFARE_LY_SITE = git://github.com/nfc-tools/libfreefare

LIBFREEFARE_LY_DEPENDENCIES = libnfc_ly openssl
LIBFREEFARE_LY_LICENSE = LGPL-3.0+ with exception
LIBFREEFARE_LY_LICENSE_FILES = COPYING

LIBFREEFARE_LY_INSTALL_STAGING = YES
LIBFREEFARE_LY_AUTORECONF=YES
LIBFREEFARE_LY_AUTORECONF_OPTS=-vi


ifeq ($(BR2_STATIC_LIBS),y)
# openssl needs zlib even if the libfreefare example itself doesn't
LIBFREEFARE_LY_CONF_ENV += LIBS='-lz'
endif

$(eval $(autotools-package))
