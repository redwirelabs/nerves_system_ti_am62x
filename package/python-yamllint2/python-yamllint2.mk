################################################################################
#
# python-yamllint
#
################################################################################

PYTHON_YAMLLINT2_VERSION = 1.35.1
PYTHON_YAMLLINT2_SOURCE = yamllint-$(PYTHON_YAMLLINT2_VERSION).tar.gz
PYTHON_YAMLLINT2_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
PYTHON_YAMLLINT2_SETUP_TYPE = setuptools
PYTHON_YAMLLINT2_LICENSE = GPL-3.0
PYTHON_YAMLLINT2_LICENSE_FILES = LICENSE

HOST_PYTHON_YAMLLINT2_DEPENDENCIES += \
	host-python-pathspec \
	host-python-pyyaml

$(eval $(python-package))
$(eval $(host-python-package))
