################################################################################
#
# kernel_modules
#
################################################################################

MIPI_DSI_ILI9881D_VERSION = 1.0
MIPI_DSI_ILI9881D_SOURCE = 
#MIPI_DSI_ILI9881D_SITE = ./
# MIPI_DSI_ILI9881D_SITE = $(TOPDIR)/package/skeleton/src/
# MIPI_DSI_ILI9881D_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
