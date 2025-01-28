# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/beartype/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev doc-rtd test test-tox test-tox-coverage"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( >=dev-python/autoapi-0.9.0[${PYTHON_USEDEP}] )
	doc-rtd? ( >=dev-python/autoapi-0.9.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/coverage-5.5[${PYTHON_USEDEP}] )
	test-tox-coverage? ( >=dev-python/coverage-5.5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/coverage-5.5[${PYTHON_USEDEP}] )
	dev-python/equinox[${PYTHON_USEDEP}]
	dev-python/equinox[${PYTHON_USEDEP}]
	dev-python/equinox[${PYTHON_USEDEP}]
	dev-python/jax[cpu,${PYTHON_USEDEP}]
	dev-python/jax[cpu,${PYTHON_USEDEP}]
	dev-python/jax[cpu,${PYTHON_USEDEP}]
	dev-python/jaxtyping[${PYTHON_USEDEP}]
	dev-python/jaxtyping[${PYTHON_USEDEP}]
	dev-python/jaxtyping[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
	dev? ( dev-python/numba[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/numba[${PYTHON_USEDEP}] )
	test? ( dev-python/numba[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev? ( dev-python/pandera[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/pandera[${PYTHON_USEDEP}] )
	test? ( dev-python/pandera[${PYTHON_USEDEP}] )
	dev? ( <=dev-python/pydata-sphinx-theme-0.7.2[${PYTHON_USEDEP}] )
	doc-rtd? ( <=dev-python/pydata-sphinx-theme-0.7.2[${PYTHON_USEDEP}] )
	dev? ( dev-python/pygments[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/pygments[${PYTHON_USEDEP}] )
	test? ( dev-python/pygments[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pyright-1.1.370[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/pyright-1.1.370[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pyright-1.1.370[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-4.0.0[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/pytest-4.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-4.0.0[${PYTHON_USEDEP}] )
	dev? ( <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	doc-rtd? ( <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/sphinxext-opengraph-0.7.5[${PYTHON_USEDEP}] )
	doc-rtd? ( >=dev-python/sphinxext-opengraph-0.7.5[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/tox-3.20.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/tox-3.20.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# fragile performance test
		beartype_test/a00_unit/a70_decor/test_decorwrapper.py::test_wrapper_fail_obj_large
		# test for building docs, apparently broken too
		beartype_test/a90_func/z90_lib/a00_sphinx
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
