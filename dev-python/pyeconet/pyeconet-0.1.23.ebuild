# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Interface to the unofficial EcoNet API"
HOMEPAGE="
  https://pypi.org/project/pyeconet/
  Bug Reports, https://github.com/w1ll1am23/pyeconet/issues
  Source, https://github.com/w1ll1am23/pyeconet
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
