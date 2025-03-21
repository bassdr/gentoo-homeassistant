# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Get realtime info on stop passages of De Lijn (api.delijn.be)"
HOMEPAGE="
  https://pypi.org/project/pydelijn/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (<4.0,>=3.6.2)
	async-timeout (<5.0,>=4.0.0)
	pytz (>=2020.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}] <dev-python/async-timeout-5.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
