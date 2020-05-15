################################################################################
#
# python-pyocd
#
################################################################################
PYTHON_PYOCD_VERSION = v0.25.0
PYTHON_PYOCD_SITE = $(call github,mbedmicro,pyOCD,$(PYTHON_PYOCD_VERSION))
PYTHON_PYOCD_SETUP_TYPE = setuptools
PYTHON_PYOCD_LICENSE = Apache-2.0
PYTHON_PYOCD_LICENSE_FILES = LICENSE

$(eval $(python-package))
