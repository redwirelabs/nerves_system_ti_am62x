################################################################################
#
# python-rpds-py
#
################################################################################

PYTHON_RPDS_PY2_VERSION = 0.18.1
PYTHON_RPDS_PY2_SOURCE = rpds_py-$(PYTHON_RPDS_PY2_VERSION).tar.gz
PYTHON_RPDS_PY2_SITE = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
PYTHON_RPDS_PY2_SETUP_TYPE = pep517
PYTHON_RPDS_PY2_LICENSE = MIT
PYTHON_RPDS_PY2_LICENSE_FILES = LICENSE

HOST_PYTHON_RPDS_PY2_DEPENDENCIES = \
	host-python-maturin

$(eval $(python-package))
$(eval $(host-python-package))
