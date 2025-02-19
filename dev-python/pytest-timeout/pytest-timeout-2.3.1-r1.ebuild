# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="pytest plugin to abort hanging tests"
HOMEPAGE="
  https://pypi.org/project/pytest-timeout/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# do not rdepend on pytest, it won't be used without it anyway
# pytest-cov used to test compatibility
REQUIRES_DIST="
	pytest >=7.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		dev-python/pexpect[${PYTHON_USEDEP}]
	)
"

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_timeout

	if has_version "dev-python/pytest-cov[${PYTHON_USEDEP}]"; then
		PYTEST_PLUGINS+=,pytest_cov.plugin
	else
		EPYTEST_DESELECT+=(
			test_pytest_timeout.py::test_cov
		)
	fi

	epytest
}
