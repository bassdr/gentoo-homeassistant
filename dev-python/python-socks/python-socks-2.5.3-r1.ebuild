# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Core proxy (SOCKS4, SOCKS5, HTTP tunneling) functionality for Python"
HOMEPAGE="
  https://pypi.org/project/python-socks/
"
SRC_URI="
	https://github.com/romis2012/python-socks/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

# curio is not packaged
# asyncio is the only backend we have, so dep on its deps unconditionally
# TODO: revisit
GENERATED_IUSE="anyio curio trio"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	anyio<5.0.0,>=3.3.4; extra == "anyio"
	async-timeout>=3.0.1; python_version < "3.11" and extra == "asyncio"
	curio>=1.4; extra == "curio"
	trio>=0.16.0; extra == "trio"
"
GENERATED_RDEPEND="${RDEPEND}
	anyio? ( >=dev-python/anyio-3.3.4[${PYTHON_USEDEP}] <dev-python/anyio-5.0.0[${PYTHON_USEDEP}] )
	curio? ( >=dev-python/curio-1.4[${PYTHON_USEDEP}] )
	trio? ( >=dev-python/trio-0.16.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		dev-python/async-timeout[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		>=dev-python/anyio-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
		>=dev-python/flask-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.18.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-trio-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/tiny-proxy-0.1.1[${PYTHON_USEDEP}]
		>=dev-python/trio-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/trustme-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/yarl-1.4.2[${PYTHON_USEDEP}]
	)
"

# Test markers exist to exclude trio etc if needed
distutils_enable_tests pytest
