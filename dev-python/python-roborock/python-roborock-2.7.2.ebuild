# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="A package to control Roborock vacuums."
HOMEPAGE="
  https://pypi.org/project/python-roborock/
  Documentation, https://python-roborock.readthedocs.io/
  Repository, https://github.com/humbertogontijo/python-roborock
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	>=dev-python/click-8[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	<dev-python/construct-3.0.0[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	<dev-python/dacite-2.0.0[${PYTHON_USEDEP}]
	dev-python/dacite[${PYTHON_USEDEP}]
	<dev-python/paho-mqtt-2.0.0[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	<dev-python/pycryptodome-4.0[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	<dev-python/pycryptodomex-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.2[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.57[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
