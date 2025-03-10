# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

MY_P=plotly.py-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/plotly/"
SRC_URI="
	https://github.com/plotly/plotly.py/archive/refs/tags/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}/packages/python/plotly"
# The tests are not included in the PyPI tarball, to use the GitHub tarball
# we have to skip npm, which means that the resulting install will
# unfortunately lack the jupyterlab extension.

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="express"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	narwhals>=1.15.1
	numpy; extra == 'express'
	packaging
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/narwhals-1.15.1[${PYTHON_USEDEP}]
	express? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/tenacity-6.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/versioneer[${PYTHON_USEDEP}]
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		dev-python/jupyter[${PYTHON_USEDEP}]
		dev-python/jupyterlab[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/shapely[${PYTHON_USEDEP}]
		dev-python/statsmodels[${PYTHON_USEDEP}]
		dev-python/xarray[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
	)
"

# There are sphinx docs but we are missing a bunch of dependencies.
# distutils_enable_sphinx ../../../doc/apidoc
distutils_enable_tests pytest

# README ends up a broken symlink
DOCS=()

python_prepare_all() {
	local PATCHES=(
		# https://github.com/plotly/plotly.py/pull/4622
		"${FILESDIR}/${PN}-5.23.0-numpy-2.patch"
	)

	distutils-r1_python_prepare_all

	# unbundle versioneer
	rm versioneer.py || die
	# Do not try to fetch stuff with npm
	export SKIP_NPM=1
}

python_test() {
	local EPYTEST_IGNORE=(
		# kaleido not packaged
		plotly/tests/test_optional/test_kaleido

		# plotly-orca not packaged
		plotly/tests/test_orca
	)

	local EPYTEST_DESELECT=(
		# kaleido not packaged
		plotly/tests/test_orca/test_to_image.py::test_bytesio

		# fails in non-isolated env
		test_init/test_dependencies_not_imported.py::test_dependencies_not_imported
		test_init/test_lazy_imports.py::test_lazy_imports

		# Minor matplotlib incompatibility
		plotly/matplotlylib/mplexporter/tests/test_basic.py::test_legend_dots
		plotly/matplotlylib/mplexporter/tests/test_utils.py::test_linestyle

		# TODO
		plotly/tests/test_io/test_to_from_plotly_json.py::test_sanitize_json

		# two subtests that require 'vaex' and 'polars' respectively
		plotly/tests/test_optional/test_px/test_px_input.py::test_build_df_from_vaex_and_polars
		plotly/tests/test_optional/test_px/test_px_input.py::test_build_df_with_hover_data_from_vaex_and_polars

		# the usual recursion problem
		plotly/tests/test_optional/test_utils/test_utils.py::test_masked_constants_example
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

python_install_all() {
	distutils-r1_python_install_all

	mv "${ED}"/{usr/etc,etc} || die
}
