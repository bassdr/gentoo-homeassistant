# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API wrapper for Uptime Robot."
HOMEPAGE="
  https://pypi.org/project/pyuptimerobot/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (<4.0,>=3.6.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
