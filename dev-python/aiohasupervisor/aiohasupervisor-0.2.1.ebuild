# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous python client for Home Assistant Supervisor."
HOMEPAGE="
  https://pypi.org/project/aiohasupervisor/
  Homepage, https://www.home-assistant.io/
  Source Code, https://github.com/home-assistant-libs/python-supervisor-client
  Bug Reports, https://github.com/home-assistant-libs/python-supervisor-client/issues
  Docs: Dev, https://developers.home-assistant.io/
  Discord, https://www.home-assistant.io/join-chat/
  Forum, https://community.home-assistant.io/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.3.0
	aiohttp==3.9.5; extra == 'dev'
	aioresponses==0.7.6; extra == 'dev'
	codespell==2.3.0; extra == 'dev'
	coverage==7.6.0; extra == 'dev'
	mashumaro<4.0,>=3.11
	mashumaro==3.13.1; extra == 'dev'
	mypy==1.10.1; extra == 'dev'
	orjson<4.0.0,>=3.6.1
	orjson==3.10.6; extra == 'dev'
	pre-commit==3.7.1; extra == 'dev'
	pytest-aiohttp==1.0.5; extra == 'dev'
	pytest-cov==5.0.0; extra == 'dev'
	pytest-timeout==2.3.1; extra == 'dev'
	pytest==8.2.2; extra == 'dev'
	ruff==0.5.2; extra == 'dev'
	yamllint==1.35.1; extra == 'dev'
	yarl<2.0.0,>=1.6.0
	yarl==1.9.4; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.6.1[${PYTHON_USEDEP}] <dev-python/orjson-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}] <dev-python/yarl-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
		~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
		~dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
		~dev-python/coverage-7.6.0[${PYTHON_USEDEP}]
		~dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
		~dev-python/mypy-1.10.1[${PYTHON_USEDEP}]
		~dev-python/orjson-3.10.6[${PYTHON_USEDEP}]
		~dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
		~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		~dev-python/ruff-0.5.2[${PYTHON_USEDEP}]
		~dev-python/yamllint-1.35.1[${PYTHON_USEDEP}]
		~dev-python/yarl-1.9.4[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-3.7.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
