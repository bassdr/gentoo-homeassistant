# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2022.4.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2022.4.0"

DESCRIPTION="A clean, async-focused Python3 API for IQVIA data"
HOMEPAGE="
  https://pypi.org/project/pyiqvia/
  Repository, https://github.com/bachya/pyiqvia
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8.0)
	backoff (>=1.11.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
