# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Intellifire4Py"
HOMEPAGE="
  https://pypi.org/project/intellifire4py/
  Bug Tracker, https://github.com/jeeftor/intellifire4py/issues
  Changelog, https://github.com/jeeftor/intellifire4py/releases
  Documentation, https://intellifire4py.readthedocs.io
  Repository, https://github.com/jeeftor/intellifire4py
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/aenum-3.1.11[${PYTHON_USEDEP}]
	dev-python/aenum[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	>=dev-python/rich-10.0.0[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	>=dev-python/rich-10.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
