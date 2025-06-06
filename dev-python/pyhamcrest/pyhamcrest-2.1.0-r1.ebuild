# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="PyHamcrest-${PV}"
DESCRIPTION="Hamcrest framework for matcher objects"
HOMEPAGE="
  https://pypi.org/project/pyhamcrest/
  History, https://github.com/hamcrest/PyHamcrest/blob/main/CHANGELOG.rst
  Source, https://github.com/hamcrest/PyHamcrest/
  Issues, https://github.com/hamcrest/PyHamcrest/issues
"
SRC_URI="
	https://github.com/hamcrest/PyHamcrest/archive/V${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs test tests-numpy"
IUSE="${GENERATED_IUSE} examples"

REQUIRES_DIST="
	alabaster~=0.7; extra == 'docs'
	black; extra == 'dev'
	coverage[toml]; extra == 'tests'
	dataclasses; python_version < '3.7' and extra == 'tests'
	doc2dash; extra == 'dev'
	flake8; extra == 'dev'
	mypy!=0.940; platform_python_implementation != 'PyPy' and extra == 'tests'
	numpy; extra == 'tests-numpy'
	pyhamcrest[docs,tests]; extra == 'dev'
	pyhamcrest[tests]; extra == 'tests-numpy'
	pytest-mypy-plugins; platform_python_implementation != 'PyPy' and extra == 'tests'
	pytest-mypy; extra == 'dev'
	pytest-sugar; extra == 'tests'
	pytest-xdist; extra == 'tests'
	pytest>=5.0; extra == 'tests'
	pyyaml; extra == 'tests'
	sphinx~=4.0; extra == 'docs'
	towncrier; extra == 'dev'
	tox-asdf; extra == 'dev'
	tox; extra == 'dev'
	twine; extra == 'dev'
	types-dataclasses; python_version < '3.7' and extra == 'tests'
	types-mock; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/alabaster-0.7[${PYTHON_USEDEP}] =dev-python/alabaster-0*[${PYTHON_USEDEP}] )
	tests-numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
	tests-numpy? ( dev-python/pyhamcrest[tests,${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.0[${PYTHON_USEDEP}] =dev-python/sphinx-4*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

BDEPEND+="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/doc2dash[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		!~dev-python/mypy-0.940[${PYTHON_USEDEP}]
		dev-python/pyhamcrest[docs,tests,${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/towncrier[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/tox-asdf[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/types-mock[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
