# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="SwitchBee Python Integration."
HOMEPAGE="
  https://pypi.org/project/pyswitchbee/
  homepage, https://pypi.org/project/pyswitchbee/
  repository, https://github.com/jafar-atili/pySwitchbee/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
