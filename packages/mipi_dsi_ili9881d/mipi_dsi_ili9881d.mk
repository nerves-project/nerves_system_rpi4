################################################################################
#
# kernel_modules
#
################################################################################

MIPI_DSI_ILI9881D_VERSION = 1.0
MIPI_DSI_ILI9881D_SITE = $(BR2_EXTERNAL_MIPI_DSI_ILI9881D_PATH)
MIPI_DSI_ILI9881D_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
