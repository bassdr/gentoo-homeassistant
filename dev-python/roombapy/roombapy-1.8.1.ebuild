# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python program and library to control Wi-Fi enabled iRobot Roombas"
HOMEPAGE="
  https://pypi.org/project/roombapy/
  Repository, https://github.com/pschmitt/roombapy
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test +mqtt"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	click<9.0,>=8.1; extra == 'cli'
	mashumaro<4.0,>=3.12
	orjson>=3.9.13
	paho-mqtt<1.7.0,>=1.6.1
	tabulate<0.10,>=0.9; extra == 'cli'
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( >=dev-python/click-8.1[${PYTHON_USEDEP}] <dev-python/click-9.0[${PYTHON_USEDEP}] )
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}] <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.13[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] <dev-python/paho-mqtt-1.7.0[${PYTHON_USEDEP}]
	cli? ( >=dev-python/tabulate-0.9[${PYTHON_USEDEP}] <dev-python/tabulate-0.10[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	mqtt? ( >=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] )
	>=dev-python/orjson-3.9.13[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
