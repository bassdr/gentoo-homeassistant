# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python implementation of the Kraken API."
HOMEPAGE="
  https://pypi.org/project/pykrakenapi/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	krakenex
	pandas
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/krakenex[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/krakenex-2.0.0[${PYTHON_USEDEP}]"
#	"dev-python/pandas[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

src_prepare() {
	sed "42,43d" -i setup.py || die
	eapply_user
}
