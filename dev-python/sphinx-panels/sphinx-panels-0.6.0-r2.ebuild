# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-panels/"
SRC_URI="
	https://github.com/executablebooks/sphinx-panels/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="code_style live-dev test themes"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	docutils
	importlib-resources (~=3.0.0) ; python_version < '3.7'
	myst-parser (~=0.12.9) ; extra == 'themes'
	pre-commit (~=2.7.0) ; extra == 'code_style'
	pydata-sphinx-theme (~=0.4.0) ; extra == 'themes'
	pytest (~=6.0.1) ; extra == 'testing'
	pytest-regressions (~=2.0.1) ; extra == 'testing'
	sphinx (<5,>=2)
	sphinx-autobuild ; extra == 'live-dev'
	sphinx-book-theme (~=0.0.36) ; extra == 'themes'
	sphinx-rtd-theme ; extra == 'themes'
	web-compile (~=0.2.0) ; extra == 'live-dev'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	themes? ( >=dev-python/myst-parser-0.12.9[${PYTHON_USEDEP}] =dev-python/myst-parser-0.12*[${PYTHON_USEDEP}] )
	themes? ( >=dev-python/pydata-sphinx-theme-0.4.0[${PYTHON_USEDEP}] =dev-python/pydata-sphinx-theme-0.4*[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-2[${PYTHON_USEDEP}] <dev-python/sphinx-5[${PYTHON_USEDEP}]
	live-dev? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	themes? ( >=dev-python/sphinx-book-theme-0.0.36[${PYTHON_USEDEP}] =dev-python/sphinx-book-theme-0.0*[${PYTHON_USEDEP}] )
	themes? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	live-dev? ( >=dev-python/web-compile-0.2.0[${PYTHON_USEDEP}] =dev-python/web-compile-0.2*[${PYTHON_USEDEP}] )
	code_style? ( >=dev-vcs/pre-commit-2.7.0[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2.7*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}] =dev-python/pytest-6.0*[${PYTHON_USEDEP}]
		>=dev-python/pytest-regressions-2.0.1[${PYTHON_USEDEP}] =dev-python/pytest-regressions-2.0*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	# https://github.com/executablebooks/sphinx-panels/pull/84
	"${FILESDIR}/${P}-sphinx-7.patch"
)

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-rtd-theme

src_prepare() {
	# unpin deps
	sed -i -e 's:,<[0-9.]*::' setup.py || die
	distutils-r1_src_prepare
}
