# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Matter WebSocket Server"
HOMEPAGE="
  https://pypi.org/project/python-matter-server/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="server test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
	aiohttp==3.10.8; extra == 'server'
	aioresponses==0.7.6; extra == 'test'
	aiorun
	aiorun==2024.8.1; extra == 'server'
	async-timeout
	async-timeout==4.0.3; extra == 'server'
	codespell==2.3.0; extra == 'test'
	coloredlogs
	coloredlogs==15.0.1; extra == 'server'
	cryptography==43.0.1; extra == 'server'
	home-assistant-chip-clusters==2024.9.0
	home-assistant-chip-core==2024.9.0; extra == 'server'
	isort==5.13.2; extra == 'test'
	mypy==1.11.2; extra == 'test'
	orjson
	orjson==3.10.7; extra == 'server'
	pre-commit-hooks==4.6.0; extra == 'test'
	pre-commit==3.8.0; extra == 'test'
	pylint==3.3.1; extra == 'test'
	pytest-aiohttp==1.0.5; extra == 'test'
	pytest-asyncio==0.24.0; extra == 'test'
	pytest-cov==5.0.0; extra == 'test'
	pytest==8.3.3; extra == 'test'
	ruff==0.6.8; extra == 'test'
	tomli==2.0.1; extra == 'test'
	zeroconf==0.135.0; extra == 'server'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	server? ( ~dev-python/aiohttp-3.10.8[${PYTHON_USEDEP}] )
	dev-python/aiorun[${PYTHON_USEDEP}]
	server? ( ~dev-python/aiorun-2024.8.1[${PYTHON_USEDEP}] )
	dev-python/async-timeout[${PYTHON_USEDEP}]
	server? ( ~dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}] )
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	server? ( ~dev-python/coloredlogs-15.0.1[${PYTHON_USEDEP}] )
	server? ( ~dev-python/cryptography-43.0.1[${PYTHON_USEDEP}] )
	~dev-python/home-assistant-chip-clusters-2024.9.0[${PYTHON_USEDEP}]
	server? ( ~dev-python/home-assistant-chip-core-2024.9.0[${PYTHON_USEDEP}] )
	dev-python/orjson[${PYTHON_USEDEP}]
	server? ( ~dev-python/orjson-3.10.7[${PYTHON_USEDEP}] )
	server? ( ~dev-python/zeroconf-0.135.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiorun[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	~dev-python/home-assistant-chip-clusters-2024.9.0[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
		~dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
		~dev-python/isort-5.13.2[${PYTHON_USEDEP}]
		~dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
		~dev-python/pre-commit-hooks-4.6.0[${PYTHON_USEDEP}]
		~dev-python/pylint-3.3.1[${PYTHON_USEDEP}]
		~dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		~dev-python/ruff-0.6.8[${PYTHON_USEDEP}]
		~dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-3.8.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
