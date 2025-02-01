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
GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${PYTHON_DEPS}
	tests? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	>dev-python/attrs-18.1[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	tests? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	tests? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	tests? ( >dev-python/pytest-3.6.4[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}] )
	tests? ( ~dev-python/pytest-asyncio-0.21.2[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/attrs-18.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
