################################################################################
#
# python-jsonschema-specifications
#
################################################################################

PYTHON_JSONSCHEMA_SPECIFICATIONS2_VERSION = 2023.12.1
PYTHON_JSONSCHEMA_SPECIFICATIONS2_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS2_VERSION).tar.gz
PYTHON_JSONSCHEMA_SPECIFICATIONS2_SITE = https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b
PYTHON_JSONSCHEMA_SPECIFICATIONS2_SETUP_TYPE = pep517
PYTHON_JSONSCHEMA_SPECIFICATIONS2_LICENSE = MIT
PYTHON_JSONSCHEMA_SPECIFICATIONS2_LICENSE_FILES = COPYING
PYTHON_JSONSCHEMA_SPECIFICATIONS2_DEPENDENCIES = \
	host-python-hatchling \
	host-python-hatch-vcs

HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS2_DEPENDENCIES = \
	host-python-hatchling \
	host-python-hatch-vcs

# This is a runtime dependency, but we don't have the concept of
# runtime dependencies for host packages.
HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS2_DEPENDENCIES += \
	host-python-referencing2

$(eval $(python-package))
$(eval $(host-python-package))
