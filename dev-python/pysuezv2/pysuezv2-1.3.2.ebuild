# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
PYPI_PN="pysuezV2"
inherit distutils-r1 pypi

DESCRIPTION="Get your water consumption data from your Suez account (www.toutsurmoneau.fr or www.eau-olivet.fr)"
HOMEPAGE="
  https://pypi.org/project/pysuezV2/
  Homepage, https://github.com/jb101010-2/pySuez
  Issues, https://github.com/jb101010-2/pySuez/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
