# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parse-type/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="develop docs testing"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	develop? ( >=dev-python/build-0.5.1[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/coverage-4.4[${PYTHON_USEDEP}] )
	dev-python/enum34[${PYTHON_USEDEP}]
	>=dev-python/parse-1.18.0[${PYTHON_USEDEP}]
	develop? ( dev-python/pylint[${PYTHON_USEDEP}] )
	>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/pytest-html-1.19.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-html-1.19.0[${PYTHON_USEDEP}] )
	develop? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	develop? ( dev-python/setuptools-scm[${PYTHON_USEDEP}] )
	>=dev-python/six-1.15[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-1.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-bootstrap-theme-0.6.0[${PYTHON_USEDEP}] )
	develop? ( <dev-python/tox-4.0[${PYTHON_USEDEP}] )
	develop? ( >=dev-python/twine-1.13.0[${PYTHON_USEDEP}] )
	<dev-python/virtualenv-20.22.0[${PYTHON_USEDEP}]
	develop? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/parse[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

DOCS=( CHANGES.txt README.rst )

python_prepare_all() {
	distutils-r1_python_prepare_all

	# disable unnecessary html test report and its pytest-html dependency
	sed -i '/^addopts/,/report.xml$/d' pytest.ini || die
}
