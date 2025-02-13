# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-xprocess/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pytest-2.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
