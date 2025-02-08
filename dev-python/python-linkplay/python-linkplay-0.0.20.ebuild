# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python Library for Seamless LinkPlay Device Control"
HOMEPAGE="
  https://pypi.org/project/python-linkplay/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS=""

REQUIRES_DIST="
	aiofiles>=23.1.0
	aiohttp>=3.8.5
	appdirs>=1.4.4
	async-timeout>=4.0.3
	async-upnp-client>=0.36.2
	deprecated>=1.2.14
	mypy>=1.3.0; extra == "testing"
	pre-commit>=3.8.0; extra == "testing"
	pytest-asyncio>=0.23.3; extra == "testing"
	pytest-cov>=4.1.0; extra == "testing"
	pytest-mock>=3.10.0; extra == "testing"
	pytest>=7.3.1; extra == "testing"
	ruff>=0.5.4; extra == "testing"
	tox>=4.6.0; extra == "testing"
	typing-extensions>=4.6.3; extra == "testing"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	>=dev-python/async-upnp-client-0.36.2[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2.14[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/async-upnp-client-0.36.2[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2.14[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/mypy-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.5.4[${PYTHON_USEDEP}]
		>=dev-python/tox-4.6.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.6.3[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-3.8.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
