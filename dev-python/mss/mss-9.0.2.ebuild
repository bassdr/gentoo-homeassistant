# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mss/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dev test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	dev? ( ~dev-python/build-1.2.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/mypy-1.11.2[${PYTHON_USEDEP}] )
	~dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	test? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-8.3.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-rerunfailures-14.0.0[${PYTHON_USEDEP}] )
	~dev-python/pyvirtualdisplay-3.0[${PYTHON_USEDEP}]
	dev? ( ~dev-python/ruff-0.6.3[${PYTHON_USEDEP}] )
	test? ( ~dev-python/sphinx-8.0.2[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/twine-5.1.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/wheel-0.44.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pyvirtualdisplay[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source dev-python/sphinx-rtd-theme

src_prepare() {
	distutils-r1_src_prepare
	sed -i -e '/--cov/d' pyproject.toml || die
}

src_test() {
	virtx distutils-r1_src_test
}

python_test() {
	local EPYTEST_IGNORE=(
		# upstream tests for self-build, apparently broken by setuptools
		# issuing deprecation warnings
		src/tests/test_setup.py
	)

	local EPYTEST_DESELECT=(
		# unreliable `lsof -U | grep ...` tests
		src/tests/test_leaks.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p rerunfailures
}
