# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library for communicating with devices from Axis Communications"
HOMEPAGE="
  https://pypi.org/project/axis/
  Source Code, https://github.com/Kane610/axis
  Bug Reports, https://github.com/Kane610/axis/issues
  Forum, https://community.home-assistant.io/t/axis-camera-component/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="requirements requirements-dev requirements-test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx==0.27.2; extra == "requirements"
	httpx>=0.26
	mypy==1.12.1; extra == "requirements-test"
	orjson==3.10.9; extra == "requirements"
	orjson>3.9
	packaging==24.1; extra == "requirements"
	packaging>23
	pre-commit==4.0.1; extra == "requirements-dev"
	pytest-aiohttp==1.0.5; extra == "requirements-test"
	pytest-asyncio==0.24.0; extra == "requirements-test"
	pytest-cov==5.0.0; extra == "requirements-test"
	pytest==8.3.3; extra == "requirements-test"
	respx==0.21.1; extra == "requirements-test"
	ruff==0.7.0; extra == "requirements-test"
	types-orjson==3.6.2; extra == "requirements-test"
	types-xmltodict==v0.14.0.20241009; extra == "requirements-test"
	xmltodict==0.14.2; extra == "requirements"
	xmltodict>=0.13.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.26[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/httpx-0.27.2[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/mypy-1.12.1[${PYTHON_USEDEP}] )
	>dev-python/orjson-3.9[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/orjson-3.10.9[${PYTHON_USEDEP}] )
	>dev-python/packaging-23[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/packaging-24.1[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-8.3.3[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/respx-0.21.1[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/ruff-0.7.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/types-orjson-3.6.2[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/types-xmltodict-0.14.0.20241009[${PYTHON_USEDEP}] )
	>=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/xmltodict-0.14.2[${PYTHON_USEDEP}] )
	requirements-dev? ( ~dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
