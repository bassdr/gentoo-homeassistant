# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Mozart platform API"
HOMEPAGE="
  https://pypi.org/project/mozart-api/
  Bug Tracker, https://github.com/bang-olufsen/mozart-open-api/issues
  Documentation, https://bang-olufsen.github.io/mozart-open-api/
  Repository, https://github.com/bang-olufsen/mozart-open-api
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aenum>=3.1.11
	aioconsole>=0.4.1
	aiohttp<4,>=3.8.3
	inflection>=0.5.1
	pydantic>=1.10
	python-dateutil>=2.8.2
	typing-extensions>=4.7.1
	urllib3>=1.25.3
	zeroconf>=0.25.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aenum-3.1.11[${PYTHON_USEDEP}]
	>=dev-python/aioconsole-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/inflection-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.25.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.5[${PYTHON_USEDEP}]
	>=dev-python/aenum-3.1.11[${PYTHON_USEDEP}]
	>=dev-python/aioconsole-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/inflection-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.1[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.25.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
