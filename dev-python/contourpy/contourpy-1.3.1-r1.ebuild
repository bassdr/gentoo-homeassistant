# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/contourpy/"
SRC_URI="
	https://github.com/contourpy/contourpy/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="bokeh docs mypy test-no-images"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Pillow; extra == 'test'
	bokeh; extra == 'bokeh'
	contourpy[bokeh,docs]; extra == 'mypy'
	contourpy[test-no-images]; extra == 'test'
	docutils-stubs; extra == 'mypy'
	furo; extra == 'docs'
	matplotlib; extra == 'test'
	mypy==1.11.1; extra == 'mypy'
	numpy>=1.23
	pytest-cov; extra == 'test-no-images'
	pytest-rerunfailures; extra == 'test-no-images'
	pytest-xdist; extra == 'test-no-images'
	pytest; extra == 'test-no-images'
	selenium; extra == 'bokeh'
	sphinx-copybutton; extra == 'docs'
	sphinx>=7.2; extra == 'docs'
	types-Pillow; extra == 'mypy'
	wurlitzer; extra == 'test-no-images'
"
GENERATED_RDEPEND="${RDEPEND}
	bokeh? ( dev-python/bokeh[${PYTHON_USEDEP}] )
	mypy? ( dev-python/contourpy[bokeh,docs,${PYTHON_USEDEP}] )
	mypy? ( dev-python/docutils-stubs[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	mypy? ( ~dev-python/mypy-1.11.1[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
	test-no-images? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-no-images? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test-no-images? ( dev-python/pytest-rerunfailures[${PYTHON_USEDEP}] )
	test-no-images? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	bokeh? ( dev-python/selenium[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	mypy? ( dev-python/types-pillow[${PYTHON_USEDEP}] )
	test-no-images? ( dev-python/wurlitzer[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/pybind11-2.13.4[${PYTHON_USEDEP}]
	test? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/wurlitzer[${PYTHON_USEDEP}]
	)
"

DISTUTILS_ARGS=(
	-Dwerror=false
)

EPYTEST_XDIST=1
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/contourpy[test-no-images,${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_IGNORE=(
		# linters
		tests/test_codebase.py
	)
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
