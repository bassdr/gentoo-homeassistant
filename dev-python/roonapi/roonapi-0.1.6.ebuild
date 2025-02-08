# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Provides a python interface to interact with Roon"
HOMEPAGE="
  https://pypi.org/project/roonapi/
  Repository, https://github.com/pavoni/pyroon
"
SRC_URI="https://github.com/pavoni/pyroon/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	ifaddr (>=0.1.0)
	requests (>=2.0)
	six (>=1.10.0)
	websocket_client (>=1.4.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/ifaddr-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/ifaddr-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.4.0[${PYTHON_USEDEP}]"

S="${WORKDIR}/pyroon-${PV}"
