# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control various Nice access control products"
HOMEPAGE="
  https://pypi.org/project/nice-go/
  Documentation, https://IceBotYT.github.io/nice-go
  Repository, https://github.com/IceBotYT/nice-go
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiobotocore<3.0.0,>=2.13.1
	aiohttp<4.0.0,>=3.9.5
	pycognito<2025.0.0,>=2024.5.1
	tenacity<9.0.0,>=8.5.0
	yarl<2.0.0,>=1.9.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiobotocore-2.13.1[${PYTHON_USEDEP}] <dev-python/aiobotocore-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycognito-2024.5.1[${PYTHON_USEDEP}] <dev-python/pycognito-2025.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.5.0[${PYTHON_USEDEP}] <dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}] <dev-python/yarl-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/aiobotocore-2.13.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]
	>=dev-python/pycognito-2024.5.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.5.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
