# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python program and library to control Wi-Fi enabled ROMY vacuum cleaners"
HOMEPAGE="
  https://pypi.org/project/romy/
  Homepage, https://github.com/xeniter/romy
  Bug Tracker, https://github.com/xeniter/romy/issues
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
