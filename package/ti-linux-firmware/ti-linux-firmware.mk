################################################################################
#
# ti-linux-firmware
#
################################################################################

TI_LINUX_FIRMWARE_VERSION = 08.06.00.007
TI_LINUX_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
TI_LINUX_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_LINUX_FIRMWARE_VERSION).tar.gz
TI_LINUX_FIRMWARE_INSTALL_IMAGES = YES
TI_LINUX_FIRMWARE_LICENSE = TI Proprietary
TI_LINUX_FIRMWARE_LICENSE_FILES = LICENCE.ti

UBOOT_PRE_BUILD_HOOKS += TI_LINUX_FIRMWARE_RDEPEND_CMD

define TI_LINUX_FIRMWARE_RDEPEND_CMD
	$(MAKE) ti-linux-firmware -C $(BASE_DIR)
endef

TI_DM_FW_DIR = ti-dm/am62xx
TI_DM_FW_FILE = ipc_echo_testb_mcu1_0_release_strip.xer5f

UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/$(TI_DM_FW_DIR)/$(TI_DM_FW_FILE)

# ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${DM_FW_DIR}/${FW_NAME} ${S}/${DM_FW_DIR}/${FW_NAME}.signed

# install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${D}${INSTALL_DM_FW_DIR}/
# install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_DM_FW_DIR}/

# Alternative name? am62-main-r5f0_0-fw

define TI_LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
	cp -dpfr $(@D)/ti-sysfw $(BINARIES_DIR)/
	cp -dpfr $(@D)/ti-dm $(BINARIES_DIR)/
endef

$(eval $(generic-package))
