# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="PyHamcrest-${PV}"
DESCRIPTION="Hamcrest framework for matcher objects"
HOMEPAGE="
  https://pypi.org/project/PyHamcrest/
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
GENERATED_IUSE="dev docs tests tests-numpy"
IUSE="${GENERATED_IUSE} examples"

GENERATED_DEPEND="
	docs? ( ~dev-python/alabaster-0.7[${PYTHON_USEDEP}] )
	dev? ( dev-python/black[${PYTHON_USEDEP}] )
	tests? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	dev-python/dataclasses[${PYTHON_USEDEP}]
	dev? ( dev-python/doc2dash[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	!=dev-python/mypy-0.940[${PYTHON_USEDEP}]
	tests-numpy? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyhamcrest[docs,tests,${PYTHON_USEDEP}] )
	tests-numpy? ( dev-python/pyhamcrest[tests,${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-5.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]
	tests? ( dev-python/pytest-sugar[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	tests? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-4.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox-asdf[${PYTHON_USEDEP}] )
	dev? ( dev-python/twine[${PYTHON_USEDEP}] )
	dev-python/types-dataclasses[${PYTHON_USEDEP}]
	tests? ( dev-python/types-mock[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

distutils_enable_sphinx doc \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
# PYPI_PN could not be inserted in this ebuild
