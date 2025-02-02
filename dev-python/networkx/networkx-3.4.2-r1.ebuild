# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_FULLY_TESTED=( python3_{10..13} )
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 multiprocessing optfeature pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/networkx/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="default developer doc example extra"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	example? ( >=dev-python/cairocffi-1.7[${PYTHON_USEDEP}] )
	developer? ( ~dev-python/changelist-0.5[${PYTHON_USEDEP}] )
	example? ( >=dev-python/contextily-1.6[${PYTHON_USEDEP}] )
	example? ( >=dev-python/igraph-0.11[${PYTHON_USEDEP}] )
	doc? ( dev-python/intersphinx-registry[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/lxml-4.6[${PYTHON_USEDEP}] )
	default? ( >=dev-python/matplotlib-3.7[${PYTHON_USEDEP}] )
	example? ( >=dev-python/momepy-0.7.2[${PYTHON_USEDEP}] )
	developer? ( >=dev-python/mypy-1.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/myst-nb-1.1[${PYTHON_USEDEP}] )
	default? ( >=dev-python/numpy-1.24[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/numpydoc-1.8.0[${PYTHON_USEDEP}] )
	example? ( >=dev-python/osmnx-1.9[${PYTHON_USEDEP}] )
	default? ( >=dev-python/pandas-2.0[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pillow-9.4[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydata-sphinx-theme-0.15[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/pydot-3.0.1[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/pygraphviz-1.14[${PYTHON_USEDEP}] )
	developer? ( dev-python/rtoml[${PYTHON_USEDEP}] )
	example? ( >=dev-python/scikit-learn-1.5[${PYTHON_USEDEP}] )
	default? ( !=dev-python/scipy-1.11.0[${PYTHON_USEDEP}] )
	example? ( >=dev-python/seaborn-0.13[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-7.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-gallery-0.16[${PYTHON_USEDEP}] )
	extra? ( >=dev-python/sympy-1.10[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/texext-0.6.7[${PYTHON_USEDEP}] )
	developer? ( >=dev-vcs/pre-commit-3.2[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		>=dev-python/lxml-4.6[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			>=dev-python/matplotlib-3.7[${PYTHON_USEDEP}]
			>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
			>=dev-python/scipy-1.11.2[${PYTHON_USEDEP}]
		' "${PYTHON_FULLY_TESTED[@]}")
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-7.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-4.0[${PYTHON_USEDEP}]
)"

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	if use x86 ; then
		EPYTEST_DESELECT+=(
			# https://github.com/networkx/networkx/issues/5913 (bug #921958)
			networkx/algorithms/approximation/tests/test_traveling_salesman.py::test_asadpour_tsp
		)
	fi

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# virtx implies nonfatal
	nonfatal epytest -p xdist -n "$(makeopts_jobs)" --dist=worksteal || die
}

src_install() {
	distutils-r1_src_install
	# those examples use various assets and pre-compressed files
	docompress -x /usr/share/doc/${PF}/examples
}

pkg_postinst() {
	optfeature "recommended dependencies" "dev-python/matplotlib dev-python/numpy dev-python/pandas dev-python/scipy"
	optfeature "graph drawing and graph layout algorithms" "dev-python/pygraphviz dev-python/pydot"
	optfeature "YAML format reading and writing" "dev-python/pyyaml"
	optfeature "shapefile format reading and writing" "sci-libs/gdal[python]"
	optfeature "GraphML XML format" "dev-python/lxml"
}
# RDEPEND could not be inserted in this ebuild
