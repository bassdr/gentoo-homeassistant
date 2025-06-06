# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async UPnP Client"
HOMEPAGE="
  https://pypi.org/project/async-upnp-client/
  GitHub: repo, https://github.com/StevenLooman/async_upnp_client
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp<4.0,>3.9.0
	async-timeout<5.0,>=3.0
	defusedxml>=0.6.0
	python-didl-lite~=1.4.0
	voluptuous>=0.15.2
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0[${PYTHON_USEDEP}] <dev-python/async-timeout-5.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/python-didl-lite-1.4.0[${PYTHON_USEDEP}] =dev-python/python-didl-lite-1.4*[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/voluptuous-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3[${PYTHON_USEDEP}]
	>=dev-python/python-didl-lite-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]"

BDEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/asyncmock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
