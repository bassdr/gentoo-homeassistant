# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

PYPI_PN="incomfort_client"
inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "incomfort_client" "0.6.3-1")"
S="${WORKDIR}/incomfort_client-0.6.3-1"

DESCRIPTION="An aiohttp-based client for Intergas InComfort/InTouch Lan2RF systems"
HOMEPAGE="
  https://pypi.org/project/incomfort_client/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
	dev-python/aioresponses[${PYTHON_USEDEP}]
"

RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i '/install_requires.*/d' setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
