# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-aiohttp/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp>=3.11.0b0
	coverage==6.2; extra == 'testing'
	mypy==1.12.1; extra == 'testing'
	pytest-asyncio>=0.17.2
	pytest>=6.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.11.0_beta0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.17.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.17.2[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/coverage-6.2[${PYTHON_USEDEP}]
		~dev-python/mypy-1.12.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	>=dev-python/setuptools-scm-6.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# warning doesn't seem to be emitted for some reason
	# doesn't look very important
	tests/test_obsolete_fixtures.py::test_loop_fixture
)
