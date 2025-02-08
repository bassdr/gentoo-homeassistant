# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A python interface to the iZone airconditioner controller"
HOMEPAGE="
  https://pypi.org/project/python-izone/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.4)
	async-timeout
	netifaces
	pytest (>=6.2.2) ; extra == 'all'
	pytest (>=6.2.2) ; extra == 'test'
	pytest-aio ; extra == 'all'
	pytest-aio ; extra == 'test'
	pytest-aiohttp ; extra == 'all'
	pytest-aiohttp ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytest-6.2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-aio[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-aiohttp[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/aiounittest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6.2.2[${PYTHON_USEDEP}]
		dev-python/pytest-aio[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
