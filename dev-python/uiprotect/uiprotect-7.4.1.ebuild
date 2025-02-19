# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for Unifi Protect (Unofficial)"
HOMEPAGE="
  https://pypi.org/project/uiprotect/
  Bug Tracker, https://github.com/uilibs/uiprotect/issues
  Changelog, https://github.com/uilibs/uiprotect/blob/main/CHANGELOG.md
  Documentation, https://uiprotect.readthedocs.io
  Repository, https://github.com/uilibs/uiprotect
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiofiles>=24
	aiohttp>=3.10.0
	aioshutil>=1.3
	async-timeout>=3.0.1
	convertertools>=0.5.0
	dateparser>=1.1.0
	orjson>=3.9.15
	packaging>=23
	pillow>=10
	platformdirs>=4
	propcache>=0.0.0
	pydantic-extra-types>=2.10.1
	pydantic>=2.10.0
	pyjwt>=2.6
	rich>=10
	typer>=0.12.3
	yarl>=1.9
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-24[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/aioshutil-1.3[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/convertertools-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.15[${PYTHON_USEDEP}]
	>=dev-python/packaging-23[${PYTHON_USEDEP}]
	>=dev-python/pillow-10[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-extra-types-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.6[${PYTHON_USEDEP}]
	>=dev-python/rich-10[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.3[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/aioshutil-1.3[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.15[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.2.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.2.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.17[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.6[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12.3[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/convertertools-0.5.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
