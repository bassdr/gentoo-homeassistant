# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_/.}
DESCRIPTION="A modern skeleton for Sphinx themes."
HOMEPAGE="
  https://pypi.org/project/sphinx-basic-ng/
  Documentation, https://rtfd.io/sphinx-basic-ng/
"
SRC_URI="
	https://github.com/pradyunsg/sphinx-basic-ng/archive/${PV/_/.}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	furo ; extra == 'docs'
	ipython ; extra == 'docs'
	myst-parser ; extra == 'docs'
	sphinx (>=4.0)
	sphinx-copybutton ; extra == 'docs'
	sphinx-inline-tabs ; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-4.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/sphinx-4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/myst-parser[${PYTHON_USEDEP}]
	)
"

python_test() {
	local HTML_DOCS=()
	build_sphinx tests/barebones
	rm -r tests/barebones/_build || die
}
