################################################################################
#
# ti-k3-image-gen
#
################################################################################

TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES

TI_K3_IMAGE_GEN_DEPENDENCIES = \
	host-arm-gnu-toolchain \
	ti-linux-firmware \
	ti-k3-r5-loader-next \
	host-ti-k3-secdev

ifeq ($(BR2_PACKAGE_TI_K3_IMAGE_GEN_FW_TYPE_TIFS),y)
TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-fs")
else ifeq ($(BR2_PACKAGE_TI_K3_IMAGE_GEN_FW_TYPE_TISCI),y)
TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-sci")
else
$(error No TI K3 Image Gen firmware type set)
endif

TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_IMAGE_GEN_SOC))
TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_IMAGE_GEN_SOC_TYPE))
TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_PACKAGE_TI_K3_IMAGE_GEN_CONFIG))

TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SOC_TYPE).bin
define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
endef

define TI_K3_IMAGE_GEN_BUILD_CMDS
	$(BR2_MAKE) -C $(@D) \
		SOC=$(TI_K3_IMAGE_GEN_SOC) \
		SOC_TYPE=$(TI_K3_IMAGE_GEN_SOC_TYPE) \
		CONFIG=$(TI_K3_IMAGE_GEN_CONFIG) \
		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
		O=$(@D)/tmp \
		BIN_DIR=$(@D) \
		TI_SECURE_DEV_PKG=$(HOST_TI_K3_SECDEV_DIR)
endef

define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
endef

$(eval $(generic-package))
