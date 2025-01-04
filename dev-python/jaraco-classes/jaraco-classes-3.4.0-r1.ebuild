# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.classes"
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Utility functions for Python class constructs"
HOMEPAGE="
  https://pypi.org/project/jaraco.classes/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/more-itertools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "

distutils_enable_tests pytest
