# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="pyCEC"
inherit distutils-r1 pypi

DESCRIPTION="Provide HDMI CEC devices as objects, especially for use with Home Assistant"
HOMEPAGE="
  https://pypi.org/project/pycec/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.rst"

RDEPEND+=" !dev-python/pyCEC"

distutils_enable_tests pytest
