# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1 pypi

DESCRIPTION="HTML parser based on the WHATWG HTML specification"
HOMEPAGE="
  https://pypi.org/project/html5lib/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

PATCHES=(
	"${FILESDIR}"/${P}-pytest6.patch
)

GENERATED_IUSE="all chardet genshi"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/chardet-2.2[${PYTHON_USEDEP}] )
	chardet? ( >=dev-python/chardet-2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/genshi[${PYTHON_USEDEP}] )
	genshi? ( dev-python/genshi[${PYTHON_USEDEP}] )
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/six-1.9[${PYTHON_USEDEP}]
	dev-python/webencodings[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/six-1.9[${PYTHON_USEDEP}]
	dev-python/webencodings[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-expect[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	sed -e 's:from mock:from unittest.mock:' \
		-i html5lib/tests/test_meta.py || die
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_expect
}
