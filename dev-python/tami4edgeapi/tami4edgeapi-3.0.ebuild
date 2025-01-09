# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_PN="Tami4EdgeAPI"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/Tami4EdgeAPI/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/pypasser[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/requests[${PYTHON_USEDEP}]
	dev-python/PyPasser[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
