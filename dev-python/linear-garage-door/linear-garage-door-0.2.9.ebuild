# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control Linear Garage Doors with Python"
HOMEPAGE="
  https://pypi.org/project/linear-garage-door/
  Documentation, https://IceBotYT.github.io/linear-garage-door
  Repository, https://github.com/IceBotYT/linear-garage-door
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8.1,<4.0.0)
	dnspython (>=2.3.0,<3.0.0)
	tenacity (>=8.2.3,<9.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.3.0[${PYTHON_USEDEP}] <dev-python/dnspython-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}] <dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/dnspython-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
