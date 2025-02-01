# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python library for communicating with UniFi Network Controller API"
HOMEPAGE="
  https://pypi.org/project/aiounifi/
  Source Code, https://github.com/Kane610/aiounifi
  Bug Reports, https://github.com/Kane610/aiounifi/issues
  Forum, https://community.home-assistant.io/t/unifi-network-integration-official-thread/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="requirements requirements-dev requirements-test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/aiohttp-3.10.3[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	>dev-python/orjson-3.9[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/orjson-3.10.7[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-8.3.2[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-asyncio-0.23.8[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/ruff-0.5.7[${PYTHON_USEDEP}] )
	>=dev-python/segno-1.5.2[${PYTHON_USEDEP}]
	dev-python/segno[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/segno-1.6.1[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/trustme-1.1.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/types-orjson-3.6.2[${PYTHON_USEDEP}] )
	requirements-dev? ( ~dev-vcs/pre-commit-3.8.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/segno-1.5.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
