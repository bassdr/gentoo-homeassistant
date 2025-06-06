# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Monarch Money API for Python"
HOMEPAGE="
  https://pypi.org/project/monarchmoney/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.8.4
	gql>=3.4
	oathtool>=2.3.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/gql-3.4[${PYTHON_USEDEP}]
	>=dev-python/oathtool-2.3.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/gql[${PYTHON_USEDEP}]
	dev-python/oathtool[${PYTHON_USEDEP}]"

src_prepare() {
	echo "aiohttp>=3.8.4" >> requirements.txt || die
	eapply_user
}

distutils_enable_tests pytest
