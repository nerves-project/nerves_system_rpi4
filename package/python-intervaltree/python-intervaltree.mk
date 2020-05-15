################################################################################
#
# python-intervaltree
#
################################################################################

PYTHON_INTERVALTREE_VERSION = 3.0.2
PYTHON_INTERVALTREE_SOURCE = intervaltree-$(PYTHON_INTERVALTREE_VERSION).tar.gz
PYTHON_INTERVALTREE_SITE = https://files.pythonhosted.org/packages/e8/f9/76237755b2020cd74549e98667210b2dd54d3fb17c6f4a62631e61d31225
PYTHON_INTERVALTREE_SETUP_TYPE = setuptools
PYTHON_INTERVALTREE_LICENSE = Apache-2.0
PYTHON_INTERVALTREE_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
