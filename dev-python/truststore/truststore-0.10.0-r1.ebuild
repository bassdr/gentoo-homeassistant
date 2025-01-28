# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Verify certificates using native system trust stores"
HOMEPAGE="
  https://pypi.org/project/truststore/
  Documentation, https://truststore.readthedocs.io
  Source, https://github.com/sethmlarson/truststore
"
SRC_URI="
	https://github.com/sethmlarson/truststore/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
# The vast majority of tests require Internet access.
PROPERTIES="test_network"
RESTRICT="test"

BDEPEND="
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p pytest_httpserver
}
