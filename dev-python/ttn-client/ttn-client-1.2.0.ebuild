# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A python client to fetch/receive and parse uplink messages from The Thinks Network"
HOMEPAGE="
  https://pypi.org/project/ttn_client/
  Homepage, https://github.com/angelnu/thethinksnetwork_python_client
  Issues, https://github.com/angelnu/thethinksnetwork_python_client/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.10.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
