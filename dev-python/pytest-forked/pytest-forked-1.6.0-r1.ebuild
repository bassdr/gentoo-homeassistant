# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-forked/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

# Please do not RDEPEND on pytest; this package won't do anything
# without pytest installed, and there is no reason to force older
# implementations on pytest.
GENERATED_DEPEND="
	dev-python/py[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.10[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/py[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	local PATCHES=(
		# https://github.com/pytest-dev/pytest-forked/pull/90
		"${FILESDIR}/${P}-pytest-8.patch"
	)

	distutils-r1_src_prepare

	# this is not printed when loaded via PYTEST_PLUGINS
	sed -i -e '/loaded_pytest_plugins/d' testing/test_xfail_behavior.py || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=pytest_forked
	epytest -o tmp_path_retention_count=1
}
