# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/joblib/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	dev-python/loky[${PYTHON_USEDEP}]
"
# joblib is imported by setup.py so we need ${RDEPEND}
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/threadpoolctl[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
python_prepare_all() {
	# unbundle
	rm -r joblib/externals || die
	sed -e "/joblib.externals/d" -i pyproject.toml || die
	find -name '*.py' -exec \
		sed -e 's:\(joblib\)\?\.externals\.::' \
			-e 's:from \.externals ::' \
			-i {} + || die

	distutils-r1_python_prepare_all
}

python_test() {
	local EPYTEST_DESELECT=(
		# https://github.com/joblib/joblib/issues/1115
		joblib/test/test_memory.py::test_parallel_call_cached_function_defined_in_jupyter
		# https://github.com/joblib/joblib/issues/1478
		joblib/test/test_parallel.py::test_main_thread_renamed_no_warning
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio
}
