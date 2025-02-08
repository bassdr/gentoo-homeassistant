# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/openpyxl/"
SRC_URI="
	https://foss.heptapod.net/openpyxl/openpyxl/-/archive/${PV}/${P}.tar.bz2
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	et-xmlfile
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/et-xmlfile[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/et-xmlfile[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/lxml-5.0.3[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP},tiff,jpeg]
	)
"

distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# GC assumptions (pypy)
		openpyxl/tests/test_iter.py::test_file_descriptor_leak
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
