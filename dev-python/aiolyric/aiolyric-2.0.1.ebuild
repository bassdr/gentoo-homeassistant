# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python package for the Honeywell Lyric Platform"
HOMEPAGE="
  https://pypi.org/project/aiolyric/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.8.5; python_version < '3.12'
	aiohttp>=3.9.0b0; python_version >= '3.12'
	incremental>=22.10.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	eapply ${FILESDIR}/fix-setup.patch
	default
}
distutils_enable_tests pytest
