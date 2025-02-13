# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/setuptools-git/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-vcs/git
"
BDEPEND="
	${RDEPEND}
"

distutils_enable_tests unittest

src_test() {
	git config --global user.name "test user" || die
	git config --global user.email "test@email.com" || die
	distutils-r1_src_test
}
