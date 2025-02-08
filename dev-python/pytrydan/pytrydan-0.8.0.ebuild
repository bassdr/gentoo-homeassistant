# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library to interface with V2C EVSE Trydan"
HOMEPAGE="
  https://pypi.org/project/pytrydan/
  Bug Tracker, https://github.com/dgomes/pytrydan/issues
  Changelog, https://github.com/dgomes/pytrydan/blob/main/CHANGELOG.md
  Documentation, https://pytrydan.readthedocs.io
  Repository, https://github.com/dgomes/pytrydan
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx>=0.24.0
	orjson>=3.9.2
	rich>=10
	tenacity<9.0.0,>=8.2.2
	typer>=0.7.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.2[${PYTHON_USEDEP}]
	>=dev-python/rich-10[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.2[${PYTHON_USEDEP}] <dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.7.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/rich-10[${PYTHON_USEDEP}]
	>=dev-python/typer-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
