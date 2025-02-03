# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-regressions/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="dataframe image num"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	dataframe? ( dev-python/numpy[${PYTHON_USEDEP}] )
	image? ( dev-python/numpy[${PYTHON_USEDEP}] )
	num? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dataframe? ( dev-python/pandas[${PYTHON_USEDEP}] )
	num? ( dev-python/pandas[${PYTHON_USEDEP}] )
	image? ( dev-python/pillow[${PYTHON_USEDEP}] )
	>=dev-python/pytest-6.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-datadir-1.2.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-datadir[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/restructuredtext-lint[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
distutils_enable_sphinx doc dev-python/sphinx-rtd-theme

python_test() {
	local EPYTEST_DESELECT=()
	local EPYTEST_IGNORE=()
	if ! has_version "dev-python/matplotlib[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_image_regression.py::test_image_regression
		)
	fi
	if ! has_version "dev-python/numpy[${PYTHON_USEDEP}]"; then
		EPYTEST_IGNORE+=(
			tests/test_ndarrays_regression.py
		)
	fi
	if ! has_version "dev-python/pandas[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_filenames.py::test_foo
			tests/test_filenames.py::TestClass::test_foo
			tests/test_filenames.py::TestClassWithIgnoredName::test_foo
		)
		EPYTEST_IGNORE+=(
			tests/test_dataframe_regression.py
			tests/test_num_regression.py
		)
	fi
	if ! has_version "dev-python/pillow[${PYTHON_USEDEP}]"; then
		EPYTEST_DESELECT+=(
			tests/test_image_regression.py
		)
	fi

	epytest
}
