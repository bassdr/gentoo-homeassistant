# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="Simple Python interface for Graphviz"
HOMEPAGE="
  https://pypi.org/project/graphviz/
  Documentation, https://graphviz.readthedocs.io
  Changelog, https://graphviz.readthedocs.io/en/latest/changelog.html
  Issue Tracker, https://github.com/xflr6/graphviz/issues
  CI, https://github.com/xflr6/graphviz/actions
  Coverage, https://codecov.io/gh/xflr6/graphviz
"
SRC_URI="
	https://github.com/xflr6/graphviz/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	media-gfx/graphviz
"
BDEPEND="
	test? (
		>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-1.8[${PYTHON_USEDEP}]
		media-gfx/graphviz[gts,pdf]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -e 's:license_file:license_files:' \
		-e 's:--cov --cov-report=term --cov-report=html::' \
		-i setup.cfg || die
	distutils-r1_src_prepare
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local EPYTEST_IGNORE=(
		# workaround https://github.com/pytest-dev/pytest/issues/12123
		tests/backend/conftest.py
		tests/conftest.py
	)
	epytest -p pytest_mock
}
