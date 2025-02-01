# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-programoutput/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/furo

src_prepare() {
	distutils-r1_src_prepare

	# namespace
	rm src/sphinxcontrib/__init__.py || die
}

python_test() {
	epytest --pyargs sphinxcontrib.programoutput.tests
}
