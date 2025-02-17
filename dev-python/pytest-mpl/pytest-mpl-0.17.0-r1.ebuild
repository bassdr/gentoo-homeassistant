# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-mpl/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Jinja2
	Pillow
	importlib-resources ; python_version < '3.8'
	matplotlib
	matplotlib ==3.6 ; extra == 'docs'
	mpl-sphinx-theme >=3.6.0.dev0 ; extra == 'docs'
	packaging
	pytest
	pytest-cov ; extra == 'test'
	sphinx ; extra == 'docs'
	sphinx-design ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	docs? ( ~dev-python/matplotlib-3.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/mpl-sphinx-theme-3.6.0_pre0[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
"

EPYTEST_DESELECT=(
	tests/test_baseline_path.py::test_config
	tests/test_pytest_mpl.py::test_formats
	tests/test_results_always.py::test_config
	tests/test_use_full_test_name.py::test_config
	tests/subtests/test_subtest.py::test_default
	tests/subtests/test_subtest.py::test_html_images_only
)

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
