# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asyncio client for Russound RIO devices."
HOMEPAGE="
  https://pypi.org/project/aiorussound/
  Documentation, https://github.com/noahhusby/aiorussound
  Repository, https://github.com/noahhusby/aiorussound
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	mashumaro<4.0,>=3.11
	orjson>=3.9.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
