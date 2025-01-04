# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

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

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/pysmb[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}  dev-python/aiohttp[${PYTHON_USEDEP}]
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
