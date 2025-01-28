# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/html2text/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS=( AUTHORS.rst ChangeLog.rst README.md )

distutils_enable_tests pytest

src_prepare() {
	# naming conflict with app-text/html2text, bug 421647
	sed -e 's/html2text = html2text.cli:main/py\0/' -i setup.cfg || die
	distutils-r1_src_prepare
}
