# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Proxy connector for aiohttp"
HOMEPAGE="
  https://pypi.org/project/aiohttp-socks/
  homepage, https://github.com/romis2012/aiohttp-socks
  repository, https://github.com/romis2012/aiohttp-socks
"
SRC_URI="
	https://github.com/romis2012/aiohttp-socks/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp>=3.10.0
	python-socks[asyncio]<3.0.0,>=2.4.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/python-socks-2.4.3[asyncio,${PYTHON_USEDEP}] <dev-python/python-socks-3.0.0[asyncio,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/python-socks-2.4.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		dev-python/attrs[${PYTHON_USEDEP}]
		dev-python/yarl[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/tiny-proxy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
