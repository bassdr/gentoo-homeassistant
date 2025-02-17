# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nbclient/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	autodoc-traits; extra == 'docs'
	flaky; extra == 'docs'
	flaky; extra == 'test'
	ipykernel>=6.19.3; extra == 'docs'
	ipykernel>=6.19.3; extra == 'test'
	ipython; extra == 'docs'
	ipython; extra == 'test'
	ipywidgets; extra == 'docs'
	ipywidgets; extra == 'test'
	jupyter-client>=6.1.12
	jupyter-core!=5.0.*,>=4.12
	mock; extra == 'docs'
	moto; extra == 'docs'
	myst-parser; extra == 'docs'
	nbconvert>=7.1.0; extra == 'docs'
	nbconvert>=7.1.0; extra == 'test'
	nbformat>=5.1
	pre-commit; extra == 'dev'
	pytest-asyncio; extra == 'docs'
	pytest-asyncio; extra == 'test'
	pytest-cov>=4.0; extra == 'docs'
	pytest-cov>=4.0; extra == 'test'
	pytest<8,>=7.0; extra == 'docs'
	pytest<8,>=7.0; extra == 'test'
	sphinx-book-theme; extra == 'docs'
	sphinx>=1.7; extra == 'docs'
	sphinxcontrib-spelling; extra == 'docs'
	testpath; extra == 'docs'
	testpath; extra == 'test'
	traitlets>=5.4
	xmltodict; extra == 'docs'
	xmltodict; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/autodoc-traits[${PYTHON_USEDEP}] )
	docs? ( dev-python/flaky[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/ipykernel-6.19.3[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	>=dev-python/jupyter-client-6.1.12[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-4.12[${PYTHON_USEDEP}] !=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
	docs? ( dev-python/mock[${PYTHON_USEDEP}] )
	docs? ( dev-python/moto[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/nbconvert-7.1.0[${PYTHON_USEDEP}] )
	>=dev-python/nbformat-5.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/pytest-7.0[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/pytest-cov-4.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.7[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	docs? ( dev-python/testpath[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.4[${PYTHON_USEDEP}]
	docs? ( dev-python/xmltodict[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/jupyter-client-6.1.12[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.0[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		>=dev-python/ipykernel-6.19.3[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		>=dev-python/nbconvert-7.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
		dev-python/xmltodict[${PYTHON_USEDEP}]
	)
"

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		>=dev-python/ipykernel-6.19.3[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		>=dev-python/nbconvert-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0[${PYTHON_USEDEP}]
		dev-python/testpath[${PYTHON_USEDEP}]
		dev-python/xmltodict[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# hangs?
		'tests/test_client.py::test_run_all_notebooks[Interrupt.ipynb-opts6]'
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio -p rerunfailures --reruns=3
}
