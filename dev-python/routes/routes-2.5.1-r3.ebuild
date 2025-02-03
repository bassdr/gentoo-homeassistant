# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/routes/"
SRC_URI="
	https://github.com/bbangert/routes/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/bbangert/routes/pull/107.patch
		-> ${P}-pytest.patch
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs middleware"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/repoze-lru-0.3[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/webob[${PYTHON_USEDEP}] )
	middleware? ( dev-python/webob[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/repoze-lru-0.3[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/webob[${PYTHON_USEDEP}]
		dev-python/webtest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${DISTDIR}/${P}-pytest.patch"
)

src_prepare() {
	distutils-r1_src_prepare
	# fix the version number
	sed -i -e '/tag/d' setup.cfg || die
	find tests -name '__init__.py' -delete || die
}
