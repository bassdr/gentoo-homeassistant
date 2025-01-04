# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="A Python 3, asyncio-based library to interact with the PurpleAir API"
HOMEPAGE="
  https://pypi.org/project/aiopurpleair/
  Bug Tracker, https://github.com/bachya/aiopurpleair/issues
  Changelog, https://github.com/bachya/aiopurpleair/releases
  Repository, https://github.com/bachya/aiopurpleair
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest