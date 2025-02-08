# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for accessing BleBox smart home devices"
HOMEPAGE="
  https://pypi.org/project/blebox-uniapi/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp>=3
	jmespath>1.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}]
	>dev-python/jmespath-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/jmespath-1.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/deepmerge[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
