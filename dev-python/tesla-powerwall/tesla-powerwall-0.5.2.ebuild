# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A simple API for accessing the Tesla Powerwall over your local network"
HOMEPAGE="
  https://pypi.org/project/tesla-powerwall/
  Homepage, https://github.com/jrester/tesla_powerwall
"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/jrester/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.7.4
	orjson>=3.9.0
	pre-commit; extra == 'test'
	tox; extra == 'test'
	urllib3>=1.26.18
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.18[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.18[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/tox[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND} >=dev-python/packaging-20.0[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
