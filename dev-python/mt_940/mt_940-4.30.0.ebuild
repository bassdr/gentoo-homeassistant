# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="mt-940"
inherit distutils-r1 pypi

DESCRIPTION="A library to parse MT940 files and returns smart Python collections for statistics and manipulation."
HOMEPAGE="
  https://pypi.org/project/mt-940/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	GitPython (>=2.1.9) ; extra == 'docs'
	flake8 ; extra == 'tests'
	pytest ; extra == 'tests'
	pytest-cache ; extra == 'tests'
	pytest-cover ; extra == 'tests'
	pytest-flake8 ; extra == 'tests'
	pyyaml ; extra == 'tests'
	sphinx (>=1.7.2) ; extra == 'docs'
	sphinx2rst ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/gitpython-2.1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.7.2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx2rst[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} !dev-python/mt_940[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cache[${PYTHON_USEDEP}]
		dev-python/pytest-cover[${PYTHON_USEDEP}]
		dev-python/pytest-flake8[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
