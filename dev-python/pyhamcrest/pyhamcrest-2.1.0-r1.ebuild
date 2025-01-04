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
IUSE="examples"

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
