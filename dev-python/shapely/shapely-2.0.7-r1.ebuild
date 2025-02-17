# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=${P/_p/.post}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/shapely/"
SRC_URI="
	https://github.com/shapely/shapely/archive/${PV/_p/.post}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
DEPEND="
	dev-python/numpy:=[${PYTHON_USEDEP}]
	>=sci-libs/geos-3.11.4
"
REQUIRES_DIST="
	matplotlib; extra == 'docs'
	numpy<3,>=1.14
	numpydoc==1.1.*; extra == 'docs'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	sphinx-book-theme; extra == 'docs'
	sphinx-remove-toctrees; extra == 'docs'
	sphinx; extra == 'docs'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.14[${PYTHON_USEDEP}] <dev-python/numpy-3[${PYTHON_USEDEP}]
	docs? ( =dev-python/numpydoc-1.1*[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-remove-toctrees[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	${DEPEND}
	>=dev-python/cython-0.29.32[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/${PN}-2.0.2-c99.patch
)

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	rm -rf shapely || die
	epytest --pyargs shapely
}
