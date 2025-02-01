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
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS=""

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	>=dev-python/async-upnp-client-0.36.2[${PYTHON_USEDEP}]
	dev-python/async-upnp-client[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2.14[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	testing? ( >=dev-python/mypy-1.3.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-7.3.1[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-asyncio-0.23.3[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/ruff-0.5.4[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/tox-4.6.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/typing-extensions-4.6.3[${PYTHON_USEDEP}] )
	testing? ( >=dev-vcs/pre-commit-3.8.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
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
