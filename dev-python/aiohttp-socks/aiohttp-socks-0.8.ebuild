# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.8.0)"
S="${WORKDIR}/${PN}-0.8.0"

DESCRIPTION="Proxy connector for aiohttp"
HOMEPAGE="
  https://pypi.org/project/aiohttp-socks/
  homepage, https://github.com/romis2012/aiohttp-socks
  repository, https://github.com/romis2012/aiohttp-socks
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-2.3.2[${PYTHON_USEDEP}]
	<dev-python/python-socks-3.0.0[asyncio,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
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
