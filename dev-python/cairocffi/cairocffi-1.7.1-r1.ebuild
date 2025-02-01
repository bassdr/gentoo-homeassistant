# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi virtualx

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cairocffi/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc xcb"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cffi-1.1.0[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	xcb? ( >=dev-python/xcffib-1.4.0[${PYTHON_USEDEP}] )
"
DEPEND="
	>=dev-python/xcffib-0.3.2[${PYTHON_USEDEP}]
	x11-libs/cairo:0=[X,xcb(+)]
	x11-libs/gdk-pixbuf[jpeg]
"
RDEPEND="${GENERATED_DEPEND}
	${DEPEND}
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.1.0:=[${PYTHON_USEDEP}]
	' 'python*')
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.1.0:=[${PYTHON_USEDEP}]
	' 'python*')
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pikepdf[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pikepdf[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/ruff[${PYTHON_USEDEP}]
)"

PATCHES=(
	"${FILESDIR}"/${PN}-0.8.0-tests.patch
)

src_test() {
	virtx distutils-r1_src_test
}
