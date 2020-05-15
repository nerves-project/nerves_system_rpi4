################################################################################
#
# python-intelhex
#
################################################################################

PYTHON_INTELHEX_VERSION = 2.2.1
PYTHON_INTELHEX_SOURCE = intelhex-$(PYTHON_INTELHEX_VERSION).tar.gz
PYTHON_INTELHEX_SITE = https://files.pythonhosted.org/packages/01/66/8fab869edcc0eaf8fc030472ff379b8eeee2ef3b42f8aec6bd84e9f735e3
PYTHON_INTELHEX_SETUP_TYPE = setuptools
PYTHON_INTELHEX_LICENSE = BSD

PYTHON_INTELHEX_SETUP_TYPE = distutils

$(eval $(python-package))
