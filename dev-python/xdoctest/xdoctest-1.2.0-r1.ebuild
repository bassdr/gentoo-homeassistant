# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xdoctest/"
SRC_URI="
	https://github.com/Erotemic/xdoctest/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all all-strict docs docs-strict jupyter jupyter-strict optional optional-strict"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	all-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/attrs-19.2.0[${PYTHON_USEDEP}] )
	>=dev-python/cmake-3.25.0[${PYTHON_USEDEP}]
	~dev-python/cmake-3.25.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.0.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.3.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	~dev-python/debugpy-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.0.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	~dev-python/ipykernel-6.11.0[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/ipython-7.23.1[${PYTHON_USEDEP}] )
	>=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	~dev-python/ipython-genutils-0.2.0[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jedi-0.16[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jupyter-client-7.0.0[${PYTHON_USEDEP}] )
	all-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	jupyter-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/jupyter-core-4.7.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/myst-parser-0.18.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-0.18.0[${PYTHON_USEDEP}] )
	>=dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	~dev-python/nbconvert-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/ninja-1.11.1[${PYTHON_USEDEP}]
	~dev-python/ninja-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/pybind11-2.10.3[${PYTHON_USEDEP}]
	~dev-python/pybind11-2.10.3[${PYTHON_USEDEP}]
	all-strict? ( ~dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	optional-strict? ( ~dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	optional? ( >=dev-python/pyflakes-2.2.0[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	docs-strict? ( ~dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pygments-2.9.0[${PYTHON_USEDEP}] )
	~dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	~dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	~dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	~dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	~dev-python/pytest-4.6.0[${PYTHON_USEDEP}]
	~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/scikit-build-0.16.1[${PYTHON_USEDEP}]
	~dev-python/scikit-build-0.16.1[${PYTHON_USEDEP}]
	docs-strict? ( ~dev-python/sphinx-5.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autoapi-1.8.4[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.0.1[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs-strict? ( ~dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-napoleon-0.7[${PYTHON_USEDEP}] )
	>=dev-python/tomli-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-0.2.0[${PYTHON_USEDEP}]
	~dev-python/tomli-0.2.0[${PYTHON_USEDEP}]
	~dev-python/tomli-0.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
"
# dev-python/nbformat-5.1.{0..2} did not install package data
BDEPEND="
	test? (
		>=dev-python/nbformat-5.1.2-r1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
#distutils_enable_sphinx docs/source \
#	dev-python/autoapi \
#	dev-python/sphinx-rtd-theme

python_test() {
	local EPYTEST_DESELECT=(
		tests/test_pytest_cli.py::test_simple_pytest_import_error_cli
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	local -x PYTEST_PLUGINS=xdoctest.plugin

	epytest --pyargs tests xdoctest
}
