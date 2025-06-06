# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Cloudflare DNS API Python Wrapper"
HOMEPAGE="
  https://pypi.org/project/pycfdns/
  Repository, https://github.com/ludeeus/pycfdns
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.8,<4.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

src_prepare() {
	# remove unsupported dynamic-versioning
	sed 's/"0"/"${PV}"/g' -i pyproject.toml || die
	eapply_user
}
