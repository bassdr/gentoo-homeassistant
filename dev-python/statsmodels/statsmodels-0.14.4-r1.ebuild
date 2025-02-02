# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 optfeature pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/statsmodels/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="build develop docs"
IUSE="${GENERATED_IUSE} examples"

# NB: upstream requires building with numpy-2 but supports 1.x
# at runtime
GENERATED_DEPEND="${RDEPEND}
	develop? ( dev-python/colorama[${PYTHON_USEDEP}] )
	build? ( >=dev-python/cython-3.0.10[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/cython-3.0.10[${PYTHON_USEDEP}] )
	develop? ( <dev-python/cython-4[${PYTHON_USEDEP}] )
	develop? ( dev-python/flake8[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	develop? ( dev-python/isort[${PYTHON_USEDEP}] )
	develop? ( dev-python/joblib[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyter-client[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/matplotlib-3[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	docs? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	!=dev-python/pandas-2.1.0[${PYTHON_USEDEP}]
	docs? ( dev-python/pandas-datareader[${PYTHON_USEDEP}] )
	>=dev-python/patsy-0.5.6[${PYTHON_USEDEP}]
	develop? ( <dev-python/pytest-8[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-randomly[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	!=dev-python/scipy-1.9.2[${PYTHON_USEDEP}]
	develop? ( ~dev-python/setuptools-scm-8.0[toml,${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/numpy-1.22.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4[${PYTHON_USEDEP}]
	>=dev-python/patsy-0.5.6[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.8[${PYTHON_USEDEP}]
"
BDEPEND="
	${DEPEND}
	>=dev-python/cython-3.0.10[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	'dev-python/ipykernel' \
	'dev-python/jupyter-client' \
	'dev-python/matplotlib' \
	'dev-python/nbconvert' \
	'dev-python/numpydoc'

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	export VARTEXFONTS="${T}"/fonts
	export MPLCONFIGDIR="${T}"
	printf -- 'backend : Agg\n' > "${MPLCONFIGDIR}"/matplotlibrc || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x MKL_NUM_THREADS=1
	local -x OMP_NUM_THREADS=1
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	epytest statsmodels
}

python_install_all() {
	if use examples; then
		docompress -x /usr/share/doc/${PF}/examples
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "Plotting functionality" "dev-python/matplotlib"
}
