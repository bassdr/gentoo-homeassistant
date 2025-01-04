# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

MY_P=${P/_}
DESCRIPTION="Module for decorators, wrappers and monkey patching."
HOMEPAGE="
  https://pypi.org/project/wrapt/
  Bug Tracker, https://github.com/GrahamDumpleton/wrapt/issues/
  Changelog, https://wrapt.readthedocs.io/en/latest/changes.html
  Documentation, https://wrapt.readthedocs.io/
"
SRC_URI="
	https://github.com/GrahamDumpleton/wrapt/archive/${PV/_}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+native-extensions"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

python_compile() {
	local -x WRAPT_INSTALL_EXTENSIONS=$(usex native-extensions true false)
	distutils-r1_python_compile
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
