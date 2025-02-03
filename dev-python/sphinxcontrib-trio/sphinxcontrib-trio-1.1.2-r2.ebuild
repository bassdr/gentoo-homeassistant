# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-trio/"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/sphinx-1.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/cssselect[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
	)
"

# AttributeError: 'Sphinx' object has no attribute 'add_stylesheet'
#distutils_enable_sphinx docs/source
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# https://github.com/python-trio/sphinxcontrib-trio/issues/260
		tests/test_sphinxcontrib_trio.py::test_end_to_end
	)

	local -x PYTHONPATH="${BUILD_DIR}/install$(python_get_sitedir)"
	epytest
}
