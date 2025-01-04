# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Provides a python interface to interact with a device running OpenWebIf"
HOMEPAGE="
  https://pypi.org/project/openwebifpy/
  Homepage, https://github.com/autinerd/openwebifpy
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/yarl[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.21.3[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
