# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A python library for speaking to Arcam receivers"
HOMEPAGE="
  https://pypi.org/project/arcam-fmj/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiohttp; extra == 'tests'
	attrs>18.1
	coveralls; extra == 'tests'
	defusedxml; extra == 'tests'
	pytest-aiohttp>=1.0.0; extra == 'tests'
	pytest-asyncio==0.21.2; extra == 'tests'
	pytest-cov>=3.0.0; extra == 'tests'
	pytest-mock; extra == 'tests'
	pytest>3.6.4; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	>dev-python/attrs-18.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/attrs-18.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		>dev-python/pytest-3.6.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.21.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
