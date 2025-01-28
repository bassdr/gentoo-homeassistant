# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
PYPI_PN="PyLoadAPI"
inherit distutils-r1 pypi

DESCRIPTION="Simple wrapper for pyLoad's API."
HOMEPAGE="
  https://pypi.org/project/PyLoadAPI/
  Documentation, https://tr4nt0r.github.io/pyloadapi
  Source, https://github.com/tr4nt0r/pyloadapi
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	cli? ( dev-python/click[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
