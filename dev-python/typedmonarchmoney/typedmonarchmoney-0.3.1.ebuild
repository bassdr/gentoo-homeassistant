# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Typed wrapper around Monarch Money"
HOMEPAGE="
  https://pypi.org/project/typedmonarchmoney/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	monarchmoney<0.2.0,>=0.1.13
	rich>=10.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/monarchmoney-0.1.13[${PYTHON_USEDEP}] <dev-python/monarchmoney-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/rich-10.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/monarchmoney[${PYTHON_USEDEP}]"

src_prepare() {
	sed -e "/include/d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest
