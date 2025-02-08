# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library, implementing websocket connection to ZWave-Me"
HOMEPAGE="
  https://pypi.org/project/zwave-me-ws/
  Repository, https://github.com/Z-Wave-Me/zwave-me-ws
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	requests (>=2.28.1,<3.0.0)
	websocket-client (>=1.2.1,<2.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.2.1[${PYTHON_USEDEP}] <dev-python/websocket-client-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/websocket-client-1.2.1[${PYTHON_USEDEP}]"
