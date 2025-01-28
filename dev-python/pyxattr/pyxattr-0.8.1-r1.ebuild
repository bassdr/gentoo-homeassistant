# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyxattr/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	sys-apps/attr:=
"
RDEPEND="
	${DEPEND}
"

distutils_enable_tests pytest
distutils_enable_sphinx doc dev-python/recommonmark

python_prepare_all() {
	sed -i -e 's:, "-Werror"::' setup.py || die
	# Bug 548486
	sed -e "s:html_theme = 'default':html_theme = 'classic':" \
		-i doc/conf.py || die

	distutils-r1_python_prepare_all
}
