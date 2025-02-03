# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Provides an API to the Lutron Smartbridge"
HOMEPAGE="
  https://pypi.org/project/pylutron-caseta/
  Homepage, https://github.com/gurumitts/pylutron-caseta
"
SRC_URI="https://github.com/gurumitts/pylutron-caseta/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} cli test"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG.md README.md"

GENERATED_RDEPEND="${RDEPEND}
	cli? ( >=dev-python/click-8.1.2[${PYTHON_USEDEP}] =dev-python/click-8.1*[${PYTHON_USEDEP}] )
	dev-python/cryptography[${PYTHON_USEDEP}]
	cli? ( >=dev-python/xdg-5.1.1[${PYTHON_USEDEP}] =dev-python/xdg-5.1*[${PYTHON_USEDEP}] )
	cli? ( >=dev-python/zeroconf-0.38.4[${PYTHON_USEDEP}] =dev-python/zeroconf-0.38*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)"
BDEPEND="
	cli? (
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/zeroconf[${PYTHON_USEDEP}]
		dev-python/pyxdg[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/coveralls[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.14.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

python_install() {
		distutils-r1_python_install
		if ! use cli; then
				rm "${ED}"/usr/lib/python-exec/${EPYTHON}/{lap-pair,leap,leap-scan} || die
				rm "${ED}"/usr/bin/{lap-pair,leap,leap-scan} || die
		fi
}
