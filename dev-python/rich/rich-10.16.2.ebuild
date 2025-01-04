# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 optfeature

DESCRIPTION="Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal"
HOMEPAGE="
  https://pypi.org/project/rich/
  Documentation, https://rich.readthedocs.io/en/latest/
"
SRC_URI="
	https://github.com/Textualize/rich/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/commonmark[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/colorama[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.13.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		>=dev-python/attrs-21.4.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		tests/test_console.py::test_size_can_fall_back_to_std_descriptors
		# TODO: segfault in recursion (PyQt6 interfering?)
		tests/test_traceback.py::test_recursive
	)
	# version-specific output -- the usual deal
	case ${EPYTHON} in
		pypy3)
			EPYTEST_DESELECT+=(
				# pypy3.10, to be more precise
				tests/test_inspect.py::test_inspect_integer_with_methods_python310only
			)
			;;
		python3.13)
			EPYTEST_DESELECT+=(
				tests/test_inspect.py::test_inspect_builtin_function_except_python311
				tests/test_inspect.py::test_inspect_integer_with_methods_python38_and_python39
				tests/test_inspect.py::test_inspect_integer_with_methods_python310only
				tests/test_inspect.py::test_inspect_integer_with_methods_python311
				tests/test_pretty.py::test_pretty_dataclass
				tests/test_pretty.py::test_reference_cycle_dataclass
				tests/test_pretty.py::test_max_depth_dataclass
				tests/test_pretty.py::test_attrs_broken
			)
			;;
	esac

	local -x COLUMNS=80
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}

pkg_postinst() {
	optfeature "integration with HTML widgets for Jupyter" dev-python/ipywidgets
}