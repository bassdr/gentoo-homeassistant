# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for connecting to nexia"
HOMEPAGE="
  https://pypi.org/project/nexia/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest