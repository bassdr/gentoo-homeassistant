# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Provides asynchronous authentication and access to Freebox servers"
HOMEPAGE="
  https://pypi.org/project/freebox-api/
  Changelog, https://github.com/hacf-fr/freebox-api/releases
  Documentation, https://freebox-api.readthedocs.io
  Repository, https://github.com/hacf-fr/freebox-api
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp (>=3,<4)
	importlib-metadata (>=3.3,<5.0) ; python_version < '3.8'
	urllib3 (>=1.26.6,<2.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.6[${PYTHON_USEDEP}] <dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.6[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
