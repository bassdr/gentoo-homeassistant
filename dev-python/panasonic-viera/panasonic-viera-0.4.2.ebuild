# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library to control Panasonic Viera TVs"
HOMEPAGE="
  https://pypi.org/project/panasonic-viera/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.9.5
	pycryptodome<4.0.0,>=3.20.0
	xmltodict<0.14.0,>=0.13.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.20.0[${PYTHON_USEDEP}] <dev-python/pycryptodome-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] <dev-python/xmltodict-0.14.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/ruff[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
