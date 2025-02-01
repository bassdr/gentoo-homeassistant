# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python API for TP-Link Kasa and Tapo devices"
HOMEPAGE="
  https://pypi.org/project/python-kasa/
  Homepage, https://github.com/python-kasa/python-kasa
  Bug Tracker, https://github.com/python-kasa/python-kasa/issues
  Documentation, https://python-kasa.readthedocs.io
  Repository, https://github.com/python-kasa/python-kasa
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs shell speedups"
IUSE="${GENERATED_IUSE} docs shell +speedups test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/asyncclick-8.1.7[${PYTHON_USEDEP}]
	dev-python/asyncclick[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.9[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	docs? ( >=dev-python/docutils-0.17[${PYTHON_USEDEP}] )
	speedups? ( >=dev-python/kasa-crypt-0.2.0[${PYTHON_USEDEP}] )
	>=dev-python/mashumaro-3.14[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	speedups? ( >=dev-python/orjson-3.9.1[${PYTHON_USEDEP}] )
	shell? ( dev-python/ptpython[${PYTHON_USEDEP}] )
	shell? ( dev-python/rich[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.4.7[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-programoutput-0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/asyncclick-8.1.7[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.9.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	docs? (	dev-python/sphinx[${PYTHON_USEDEP}] dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] dev-python/sphinxcontrib-programoutput[${PYTHON_USEDEP}] dev-python/myst-parser[${PYTHON_USEDEP}] >=dev-python/docutils-0.17.0[${PYTHON_USEDEP}] )
	shell? ( dev-python/ptpython[${PYTHON_USEDEP}] dev-python/rich[${PYTHON_USEDEP}] )
	speedups? ( >=dev-python/orjson-3.9.1[${PYTHON_USEDEP}] >=dev-python/kasa-crypt-0.2.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
