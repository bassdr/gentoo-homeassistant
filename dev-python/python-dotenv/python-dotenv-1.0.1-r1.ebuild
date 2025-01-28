# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-dotenv/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	cli? ( >=dev-python/click-5.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		>=dev-python/click-5[${PYTHON_USEDEP}]
		>=dev-python/sh-2[${PYTHON_USEDEP}]
		!mips? ( dev-python/ipython[${PYTHON_USEDEP}] )
	)
"

DOCS=( CHANGELOG.md README.md )

distutils_enable_tests pytest

python_install() {
	distutils-r1_python_install
	ln -s dotenv "${D}$(python_get_scriptdir)"/python-dotenv || die
}

src_install() {
	distutils-r1_src_install

	# Avoid collision with dev-ruby/dotenv (bug #798648)
	mv "${ED}"/usr/bin/{,python-}dotenv || die
}
