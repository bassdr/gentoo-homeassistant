# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Bosch Smart Home Controller API Python Library"
HOMEPAGE="
  https://pypi.org/project/boschshcpy/
  Bug Reports, https://github.com/tschamm/boschshcpy/issues
  Source, https://github.com/tschamm/boschshcpy
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/getmac[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/cryptography-3.3.2[${PYTHON_USEDEP}]
	>=dev-python/getmac-0.8.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.28.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
