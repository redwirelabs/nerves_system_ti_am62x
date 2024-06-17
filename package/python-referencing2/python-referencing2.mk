################################################################################
#
# python-referencing
#
################################################################################

PYTHON_REFERENCING2_VERSION = 0.35.1
PYTHON_REFERENCING2_SOURCE = referencing-$(PYTHON_REFERENCING2_VERSION).tar.gz
PYTHON_REFERENCING2_SITE = https://files.pythonhosted.org/packages/99/5b/73ca1f8e72fff6fa52119dbd185f73a907b1989428917b24cff660129b6d
PYTHON_REFERENCING2_SETUP_TYPE = pep517
PYTHON_REFERENCING2_LICENSE = MIT
PYTHON_REFERENCING2_LICENSE_FILES = COPYING
PYTHON_REFERENCING2_DEPENDENCIES = \
	host-python-hatchling \
	host-python-hatch-vcs

HOST_PYTHON_REFERENCING2_DEPENDENCIES = \
	host-python-hatchling \
	host-python-hatch-vcs

# This is a runtime dependency, but we don't have the concept of
# runtime dependencies for host packages.
HOST_PYTHON_REFERENCING2_DEPENDENCIES += \
	host-python-attrs2 \
	host-python-rpds-py2

$(eval $(python-package))
$(eval $(host-python-package))
