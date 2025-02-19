# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gardena-bluetooth/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.rst"

REQUIRES_DIST="
	asyncclick<9.0.0.0,>=8.1.3.4; extra == 'cli' or extra == 'test'
	black<24.0.0,>=23.3.0; extra == 'test'
	bleak-retry-connector>=3.0.2
	bleak>=0.20.2
	pytest-asyncio<0.22.0,>=0.21.0; extra == 'test'
	ruff<0.0.273,>=0.0.272; extra == 'test'
	tzlocal<6.0.0,>=5.0.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.0.1[${PYTHON_USEDEP}] <dev-python/tzlocal-6.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.0.1[${PYTHON_USEDEP}]"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/asyncclick-8.1.3.4[${PYTHON_USEDEP}] <dev-python/asyncclick-9.0.0.0[${PYTHON_USEDEP}] cli? ( >=dev-python/asyncclick-8.1.3.4[${PYTHON_USEDEP}] <dev-python/asyncclick-9.0.0.0[${PYTHON_USEDEP}] )
		>=dev-python/black-23.3.0[${PYTHON_USEDEP}] <dev-python/black-24.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}] <dev-python/pytest-asyncio-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.0.272[${PYTHON_USEDEP}] <dev-python/ruff-0.0.273[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
