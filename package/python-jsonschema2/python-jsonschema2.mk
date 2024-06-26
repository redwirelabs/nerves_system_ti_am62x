################################################################################
#
# python-jsonschema2
#
################################################################################

PYTHON_JSONSCHEMA2_VERSION = 4.17.3
PYTHON_JSONSCHEMA2_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA2_VERSION).tar.gz
PYTHON_JSONSCHEMA2_SITE = https://files.pythonhosted.org/packages/36/3d/ca032d5ac064dff543aa13c984737795ac81abc9fb130cd2fcff17cfabc7
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
