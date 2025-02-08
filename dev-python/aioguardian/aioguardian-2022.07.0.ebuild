# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2022.7.0)"
S="${WORKDIR}/${PN}-2022.7.0"

DESCRIPTION="A Python3 library for Elexa Guardian water valves and sensors"
HOMEPAGE="
  https://pypi.org/project/aioguardian/
  Repository, https://github.com/bachya/aioguardian
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8.0)
	asyncio_dgram (>=2.0.0,<3.0.0)
	voluptuous (>=0.11.7)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asyncio-dgram-2.0.0[${PYTHON_USEDEP}] <dev-python/asyncio-dgram-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asyncio-dgram-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
