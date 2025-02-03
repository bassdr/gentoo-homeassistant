# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyproject-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-autodoc-typehints-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/packaging-24.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	' 3.{9..10})
"
BDEPEND="
	>=dev-python/hatch-vcs-0.3.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-mock-3.11.1[${PYTHON_USEDEP}]
		>=dev-python/setuptools-68.1.2[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.40.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
		>=dev-python/setuptools-75.8[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

EPYTEST_DESELECT=(
	# hardcodes assumptions specific to setuptools-70.1.0
	tests/test_frontend_setuptools.py::test_setuptools_get_requires_for_build_wheel
	# some minor formatting mismatch
	tests/test_frontend_setuptools.py::test_setuptools_prepare_metadata_for_build_wheel
)
