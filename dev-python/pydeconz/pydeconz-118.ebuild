# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python library for communicating with deCONZ REST-API"
HOMEPAGE="
  https://pypi.org/project/pydeconz/
  Source Code, https://github.com/Kane610/deconz
  Bug Reports, https://github.com/Kane610/deconz/issues
  Forum, https://community.home-assistant.io/t/deconz-official-thread/
"
MY_PN="deconz"
SRC_URI="https://github.com/Kane610/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="requirements requirements-dev requirements-test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="${RDEPEND}
	>dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/aiohttp-3.10.10[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/mypy-1.11.2[${PYTHON_USEDEP}] )
	>dev-python/orjson-3.9[${PYTHON_USEDEP}]
	requirements? ( ~dev-python/orjson-3.10.7[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-8.3.3[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/ruff-0.6.9[${PYTHON_USEDEP}] )
	requirements-test? ( ~dev-python/types-orjson-3.6.2[${PYTHON_USEDEP}] )
	requirements-dev? ( ~dev-vcs/pre-commit-4.0.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/aioresponses[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
