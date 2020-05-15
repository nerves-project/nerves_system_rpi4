################################################################################
#
# python-libusb
#
################################################################################

PYTHON_LIBUSB_VERSION = 1.0.22b9
PYTHON_LIBUSB_SOURCE = libusb-$(PYTHON_LIBUSB_VERSION).zip
PYTHON_LIBUSB_SITE = https://files.pythonhosted.org/packages/a6/7c/5e2f8b1daa8ac7c3463d8ac7f850e3938448d510a8ab91d0ce5f8928f17a
PYTHON_LIBUSB_SETUP_TYPE = setuptools
PYTHON_LIBUSB_LICENSE = zlib/libpng License
PYTHON_LIBUSB_LICENSE_FILES = LICENSE

define PYTHON_LIBUSB_EXTRACT_CMDS
	$(UNZIP) -d $(@D) $(DL_DIR)/python-libusb/$(PYTHON_LIBUSB_SOURCE)
endef

$(eval $(python-package))
