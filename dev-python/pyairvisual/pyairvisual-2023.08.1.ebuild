# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2023.8.1)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2023.8.1"

DESCRIPTION="A simple API for AirVisual air quality data"
HOMEPAGE="
  https://pypi.org/project/pyairvisual/
  Bug Tracker, https://github.com/bachya/pyairvisual/issues
  Changelog, https://github.com/bachya/pyairvisual/releases
  Repository, https://github.com/bachya/pyairvisual
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8.0)
	certifi (>=2023.07.22)
	numpy (>=1.22.0)
	pygments (>=2.15.0)
	pysmb (>=1.2.6,<2.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.15.0[${PYTHON_USEDEP}]
	>=dev-python/pysmb-1.2.6[${PYTHON_USEDEP}] <dev-python/pysmb-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.15.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
