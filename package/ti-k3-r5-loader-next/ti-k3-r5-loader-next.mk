################################################################################
#
# ti-k3-r5-loader-next
#
################################################################################

TI_K3_R5_LOADER_NEXT_VERSION = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_VERSION))

ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_TARBALL),y)
# Handle custom U-Boot tarballs as specified by the configuration
TI_K3_R5_LOADER_NEXT_TARBALL = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_TARBALL_LOCATION))
TI_K3_R5_LOADER_NEXT_SITE = $(patsubst %/,%,$(dir $(TI_K3_R5_LOADER_NEXT_TARBALL)))
TI_K3_R5_LOADER_NEXT_SOURCE = $(notdir $(TI_K3_R5_LOADER_NEXT_TARBALL))
else ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_GIT),y)
TI_K3_R5_LOADER_NEXT_SITE = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_REPO_URL))
TI_K3_R5_LOADER_NEXT_SITE_METHOD = git
else ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_HG),y)
TI_K3_R5_LOADER_NEXT_SITE = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_REPO_URL))
TI_K3_R5_LOADER_NEXT_SITE_METHOD = hg
else ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_SVN),y)
TI_K3_R5_LOADER_NEXT_SITE = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_REPO_URL))
TI_K3_R5_LOADER_NEXT_SITE_METHOD = svn
else
# Handle stable official U-Boot versions
TI_K3_R5_LOADER_NEXT_SITE = https://ftp.denx.de/pub/u-boot
TI_K3_R5_LOADER_NEXT_SOURCE = u-boot-$(TI_K3_R5_LOADER_NEXT_VERSION).tar.bz2
endif

ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT)$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_LATEST_VERSION),y)
BR_NO_CHECK_HASH_FOR += $(TI_K3_R5_LOADER_NEXT_SOURCE)
endif

TI_K3_R5_LOADER_NEXT_LICENSE = GPL-2.0+
TI_K3_R5_LOADER_NEXT_LICENSE_FILES = Licenses/gpl-2.0.txt
TI_K3_R5_LOADER_NEXT_CPE_ID_VENDOR = denx
TI_K3_R5_LOADER_NEXT_CPE_ID_PRODUCT = u-boot
TI_K3_R5_LOADER_NEXT_INSTALL_IMAGES = YES
# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
# Make sure that all binman requirements are built before ti-k3-r5-loader.
TI_K3_R5_LOADER_NEXT_DEPENDENCIES = \
	host-pkgconf \
	$(BR2_MAKE_HOST_DEPENDENCY) \
	host-arm-gnu-toolchain \
	host-openssl \
	host-python3 \
	host-python-attrs2 \
	host-python-jsonschema2 \
	host-python-jsonschema-specifications2 \
	host-python-pyelftools \
	host-python-pylibfdt \
	host-python-pyyaml \
	host-python-referencing2 \
	host-python-setuptools \
	host-python-yamllint2 \
	ti-k3-boot-firmware-next

TI_K3_R5_LOADER_NEXT_MAKE = $(BR2_MAKE)
TI_K3_R5_LOADER_NEXT_MAKE_ENV = $(TARGET_MAKE_ENV)
TI_K3_R5_LOADER_NEXT_KCONFIG_DEPENDENCIES = \
	host-arm-gnu-toolchain \
	$(BR2_MAKE_HOST_DEPENDENCY) \
	$(BR2_BISON_HOST_DEPENDENCY) \
	$(BR2_FLEX_HOST_DEPENDENCY)

ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_USE_DEFCONFIG),y)
TI_K3_R5_LOADER_NEXT_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_BOARD_DEFCONFIG))_defconfig
else ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_USE_CUSTOM_CONFIG),y)
TI_K3_R5_LOADER_NEXT_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_CONFIG_FILE))
endif # BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_USE_DEFCONFIG
TI_K3_R5_LOADER_NEXT_MAKE_OPTS = \
	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
	ARCH=arm \
	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
	BINMAN_INDIRS=$(BINARIES_DIR)

TI_K3_R5_LOADER_NEXT_TIBOOT3_BIN = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_TIBOOT3_BIN))

define TI_K3_R5_LOADER_NEXT_INSTALL_TIBOOT3_BIN
	cp $(@D)/$(TI_K3_R5_LOADER_NEXT_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
endef

TI_K3_R5_LOADER_NEXT_SYSFW_ITB = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_SYSFW_ITB))

# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e).
# So, if sysfw.itb symlink exist we must copy it or the custom sysfw.itb.
define TI_K3_R5_LOADER_NEXT_INSTALL_SWSFW_ITB
	if test -e $(@D)/sysfw.itb ; then \
		cp $(@D)/$(TI_K3_R5_LOADER_NEXT_SYSFW_ITB) $(BINARIES_DIR)/sysfw.itb ; \
	fi
endef

TI_K3_R5_LOADER_NEXT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_CUSTOM_DTS_PATH))

define TI_K3_R5_LOADER_NEXT_BUILD_CMDS
	$(if $(TI_K3_R5_LOADER_NEXT_CUSTOM_DTS_PATH),
		cp -f $(TI_K3_R5_LOADER_NEXT_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
	)
	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_NEXT_MAKE) -C $(@D) $(TI_K3_R5_LOADER_NEXT_MAKE_OPTS)
endef

define TI_K3_R5_LOADER_NEXT_INSTALL_IMAGES_CMDS
	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
	$(TI_K3_R5_LOADER_NEXT_INSTALL_TIBOOT3_BIN)
	$(TI_K3_R5_LOADER_NEXT_INSTALL_SWSFW_ITB)
endef

# Checks to give errors that the user can understand
# Must be before we call to kconfig-package
ifeq ($(BR2_PACKAGE_TI_K3_R5_LOADER_NEXT)$(BR_BUILDING),yy)

ifeq ($(TI_K3_R5_LOADER_NEXT_TIBOOT3_BIN),)
$(error No custom tiboot3 name specified, check your BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_TIBOOT3_BIN setting)
endif

ifeq ($(TI_K3_R5_LOADER_NEXT_SYSFW_ITB),)
$(error No custom sysfw name specified, check your BR2_PACKAGE_TI_K3_R5_LOADER_NEXT_SYSFW_ITB setting)
endif

endif # BR_BUILDING

$(eval $(kconfig-package))
