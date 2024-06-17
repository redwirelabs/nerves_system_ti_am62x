################################################################################
#
# python-jsonschema
#
################################################################################

PYTHON_JSONSCHEMA2_VERSION = 4.22.0
PYTHON_JSONSCHEMA2_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA2_VERSION).tar.gz
PYTHON_JSONSCHEMA2_SITE = https://files.pythonhosted.org/packages/19/f1/1c1dc0f6b3bf9e76f7526562d29c320fa7d6a2f35b37a1392cc0acd58263
PYTHON_JSONSCHEMA2_SETUP_TYPE = pep517
PYTHON_JSONSCHEMA2_LICENSE = MIT
PYTHON_JSONSCHEMA2_LICENSE_FILES = COPYING json/LICENSE
PYTHON_JSONSCHEMA2_DEPENDENCIES = \
	host-python-hatchling \
	host-python-hatch-fancy-pypi-readme \
	host-python-hatch-vcs

HOST_PYTHON_JSONSCHEMA2_DEPENDENCIES = $(PYTHON_JSONSCHEMA2_DEPENDENCIES)

$(eval $(python-package))
$(eval $(host-python-package))
