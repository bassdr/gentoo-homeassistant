# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2024.1.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2024.1.0"

DESCRIPTION="A Python3, async interface to the SimpliSafe API"
HOMEPAGE="
  https://pypi.org/project/simplisafe-python/
  Bug Tracker, https://github.com/bachya/simplipy/issues
  Changelog, https://github.com/bachya/simplipy/releases
  Repository, https://github.com/bachya/simplisafe-python
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (>=3.9.0b0)
	backoff (>=1.11.1)
	certifi (>=2023.07.22)
	voluptuous (>=0.11.7)
	websockets (>=8.1)
	yarl (>=1.9.2)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
