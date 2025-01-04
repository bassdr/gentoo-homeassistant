# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Async client for Yandex Maps"
HOMEPAGE="
  https://pypi.org/project/aioymaps/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest