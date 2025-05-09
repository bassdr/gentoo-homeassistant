# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="The APsystems EZ1 Python library offers a streamlined interface for interacting with the local API of APsystems EZ1 Microinverters."
HOMEPAGE="
  https://pypi.org/project/apsystems-ez1/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4,>=3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
