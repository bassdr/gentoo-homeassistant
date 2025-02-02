# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ipykernel/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cov docs pyqt5 pyside6"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	>=dev-python/comm-0.1.1[${PYTHON_USEDEP}]
	cov? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	cov? ( dev-python/curio[${PYTHON_USEDEP}] )
	>=dev-python/debugpy-1.6.5[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.23.1[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-6.1.12[${PYTHON_USEDEP}]
	!=dev-python/jupyter-core-5.0[${PYTHON_USEDEP}]
	cov? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/matplotlib-inline-0.1[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/nest-asyncio[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	pyqt5? ( dev-python/pyqt5[${PYTHON_USEDEP}] )
	pyside6? ( dev-python/pyside6[${PYTHON_USEDEP}] )
	cov? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/pyzmq-24[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	>=dev-python/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.4.0[${PYTHON_USEDEP}]
	cov? ( dev-python/trio[${PYTHON_USEDEP}] )
	docs? ( dev-python/trio[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/comm-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.23.1[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-8[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.12[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-inline-0.1[${PYTHON_USEDEP}]
	dev-python/nest-asyncio[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-24[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.4.0[${PYTHON_USEDEP}]
"
# RDEPEND seems specifically needed in BDEPEND, at least jupyter
# bug #816486
# pytest-8 runs a small subset of tests, we allow newer for 3.13
# since a few tests are better than skipping entirely
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			<dev-python/pytest-8[${PYTHON_USEDEP}]
		' 3.{10..12})
		>=dev-python/pytest-asyncio-0.23.5[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/ipyparallel[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/flaky[${PYTHON_USEDEP}]
	dev-python/ipyparallel[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.23.5[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"

src_prepare() {
	# debugpy is actually optional
	sed -i -e '/debugpy/d' pyproject.toml || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	# Use python3 in kernel.json configuration, bug #784764
	sed -i -e '/python3.[0-9]\+/s//python3/' \
		"${BUILD_DIR}/install${EPREFIX}/usr/share/jupyter/kernels/python3/kernel.json" || die
}

src_test() {
	local EPYTEST_DESELECT=(
		# TODO
		tests/test_debugger.py::test_attach_debug
		tests/test_debugger.py::test_breakpoint_in_cell_with_leading_empty_lines
		tests/test_debugger.py::test_rich_inspect_at_breakpoint
		tests/test_debugger.py::test_rich_inspect_not_at_breakpoint
		tests/test_debugger.py::test_set_breakpoints
		tests/test_debugger.py::test_stop_on_breakpoint
		tests/test_debugger.py::test_copy_to_globals
		# hangs?
		tests/test_eventloop.py::test_tk_loop
		# doesn't like pyside2?
		tests/test_eventloop.py::test_qt_enable_gui
	)

	virtx distutils-r1_src_test
}
