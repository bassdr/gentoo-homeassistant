# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PN="PasteDeploy"
MY_P="${MY_PN}-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pastedeploy/"
SRC_URI="
	https://github.com/Pylons/pastedeploy/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs paste"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	Paste ; extra == 'paste'
	Paste ; extra == 'testing'
	Sphinx >=1.7.5 ; extra == 'docs'
	importlib-metadata ; python_version < '3.8'
	pylons-sphinx-themes ; extra == 'docs'
	pytest ; extra == 'testing'
	pytest-cov ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	paste? ( dev-python/paste[${PYTHON_USEDEP}] )
	docs? ( dev-python/pylons-sphinx-themes[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-1.7.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/namespace-paste
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/paste[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

src_prepare() {
	sed -i -e 's:--cov::' pytest.ini || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}
