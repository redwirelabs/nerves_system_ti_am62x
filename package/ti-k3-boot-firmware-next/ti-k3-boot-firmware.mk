################################################################################
#
# ti-k3-boot-firmware
#
################################################################################

TI_K3_BOOT_FIRMWARE_NEXT_VERSION = 10.00.04
TI_K3_BOOT_FIRMWARE_NEXT_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
TI_K3_BOOT_FIRMWARE_NEXT_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_NEXT_VERSION).tar.gz
TI_K3_BOOT_FIRMWARE_NEXT_INSTALL_IMAGES = YES
TI_K3_BOOT_FIRMWARE_NEXT_LICENSE = TI Proprietary
TI_K3_BOOT_FIRMWARE_NEXT_LICENSE_FILES = LICENSE.ti

define TI_K3_BOOT_FIRMWARE_NEXT_INSTALL_IMAGES_CMDS
	cp -dpfr $(@D)/ti-sysfw $(BINARIES_DIR)/
	cp -dpfr $(@D)/ti-dm $(BINARIES_DIR)/
endef

$(eval $(generic-package))
