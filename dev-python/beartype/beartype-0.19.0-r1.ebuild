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

GENERATED_IUSE="doc-rtd test test-tox test-tox-coverage"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	autoapi>=0.9.0; extra == 'dev'
	autoapi>=0.9.0; extra == 'doc-rtd'
	coverage>=5.5; extra == 'dev'
	coverage>=5.5; extra == 'test'
	coverage>=5.5; extra == 'test-tox-coverage'
	equinox; sys_platform == 'linux' and extra == 'dev'
	equinox; sys_platform == 'linux' and extra == 'test'
	equinox; sys_platform == 'linux' and extra == 'test-tox'
	jax[cpu]; sys_platform == 'linux' and extra == 'dev'
	jax[cpu]; sys_platform == 'linux' and extra == 'test'
	jax[cpu]; sys_platform == 'linux' and extra == 'test-tox'
	jaxtyping; sys_platform == 'linux' and extra == 'dev'
	jaxtyping; sys_platform == 'linux' and extra == 'test'
	jaxtyping; sys_platform == 'linux' and extra == 'test-tox'
	mypy>=0.800; platform_python_implementation != 'PyPy' and extra == 'dev'
	mypy>=0.800; platform_python_implementation != 'PyPy' and extra == 'test'
	mypy>=0.800; platform_python_implementation != 'PyPy' and extra == 'test-tox'
	numba; extra == 'dev'
	numba; extra == 'test'
	numba; extra == 'test-tox'
	numpy; (sys_platform != 'darwin' and platform_python_implementation != 'PyPy') and extra == 'dev'
	numpy; (sys_platform != 'darwin' and platform_python_implementation != 'PyPy') and extra == 'test'
	numpy; (sys_platform != 'darwin' and platform_python_implementation != 'PyPy') and extra == 'test-tox'
	pandera; extra == 'dev'
	pandera; extra == 'test'
	pandera; extra == 'test-tox'
	pydata-sphinx-theme<=0.7.2; extra == 'dev'
	pydata-sphinx-theme<=0.7.2; extra == 'doc-rtd'
	pygments; extra == 'dev'
	pygments; extra == 'test'
	pygments; extra == 'test-tox'
	pyright>=1.1.370; extra == 'dev'
	pyright>=1.1.370; extra == 'test'
	pyright>=1.1.370; extra == 'test-tox'
	pytest>=4.0.0; extra == 'dev'
	pytest>=4.0.0; extra == 'test'
	pytest>=4.0.0; extra == 'test-tox'
	sphinx; python_version >= '3.8.0' and extra == 'dev'
	sphinx; python_version >= '3.8.0' and extra == 'test'
	sphinx; python_version >= '3.8.0' and extra == 'test-tox'
	sphinx<6.0.0,>=4.2.0; extra == 'dev'
	sphinx<6.0.0,>=4.2.0; extra == 'doc-rtd'
	sphinxext-opengraph>=0.7.5; extra == 'dev'
	sphinxext-opengraph>=0.7.5; extra == 'doc-rtd'
	tox>=3.20.1; extra == 'dev'
	tox>=3.20.1; extra == 'test'
	typing-extensions>=3.10.0.0; extra == 'dev'
	typing-extensions>=3.10.0.0; extra == 'test'
	typing-extensions>=3.10.0.0; extra == 'test-tox'
"
GENERATED_RDEPEND="${RDEPEND}
	doc-rtd? ( >=dev-python/autoapi-0.9.0[${PYTHON_USEDEP}] )
	test-tox-coverage? ( >=dev-python/coverage-5.5[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/equinox[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/jax[cpu,${PYTHON_USEDEP}] )
	test-tox? ( dev-python/jaxtyping[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/mypy-0.800[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/numba[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/numpy[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/pandera[${PYTHON_USEDEP}] )
	doc-rtd? ( <=dev-python/pydata-sphinx-theme-0.7.2[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/pygments[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/pyright-1.1.370[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/pytest-4.0.0[${PYTHON_USEDEP}] )
	doc-rtd? ( >=dev-python/sphinx-4.2.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}] )
	test-tox? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc-rtd? ( >=dev-python/sphinxext-opengraph-0.7.5[${PYTHON_USEDEP}] )
	test-tox? ( >=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/autoapi-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-5.5[${PYTHON_USEDEP}]
		dev-python/equinox[${PYTHON_USEDEP}]
		dev-python/jax[cpu,${PYTHON_USEDEP}]
		dev-python/jaxtyping[${PYTHON_USEDEP}]
		>=dev-python/mypy-0.800[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandera[${PYTHON_USEDEP}]
		<=dev-python/pydata-sphinx-theme-0.7.2[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pyright-1.1.370[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-4.2.0[${PYTHON_USEDEP}] <dev-python/sphinx-6.0.0[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		>=dev-python/sphinxext-opengraph-0.7.5[${PYTHON_USEDEP}]
		>=dev-python/tox-3.20.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
	)
"

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
