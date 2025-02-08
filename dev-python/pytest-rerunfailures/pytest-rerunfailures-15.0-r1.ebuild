# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="pytest plugin to re-run tests to eliminate flaky failures"
HOMEPAGE="
  https://pypi.org/project/pytest-rerunfailures/
  Homepage, https://github.com/pytest-dev/pytest-rerunfailures
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	packaging>=17.1
	pytest!=8.2.2,>=7.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/packaging-17.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.4[${PYTHON_USEDEP}] !~dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/packaging-17.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_rerunfailures
	epytest
}
