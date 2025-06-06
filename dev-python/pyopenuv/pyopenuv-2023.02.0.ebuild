# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2023.2.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2023.2.0"

DESCRIPTION="A simple Python API data from openuv.io"
HOMEPAGE="
  https://pypi.org/project/pyopenuv/
  Bug Tracker, https://github.com/bachya/pyopenuv/issues
  Changelog, https://github.com/bachya/pyopenuv/releases
  Repository, https://github.com/bachya/pyopenuv
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8.0)
	asynctest (>=0.13.0,<0.14.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}] <dev-python/asynctest-0.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		>=dev-python/aresponses-2.1.6[${PYTHON_USEDEP}]
		>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
