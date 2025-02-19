# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2024.8.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2024.8.0"

DESCRIPTION="A clean, async-friendly library for the Ambient Weather API"
HOMEPAGE="
  https://pypi.org/project/aioambient/
  Bug Tracker, https://github.com/bachya/aioambient/issues
  Changelog, https://github.com/bachya/aioambient/releases
  Repository, https://github.com/bachya/aioambient
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp>=3.9.0b0
	certifi>=2023.07.22
	python-engineio<5.0.0,>=3.13.1
	python-socketio<6.0,>=4.6
	websockets>=11.0.1
	yarl>=1.9.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}] <dev-python/python-engineio-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6[${PYTHON_USEDEP}] <dev-python/python-socketio-6.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
