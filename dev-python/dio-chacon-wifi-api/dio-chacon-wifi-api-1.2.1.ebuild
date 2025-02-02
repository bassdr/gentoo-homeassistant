# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1
SRC_URI="https://github.com/cnico/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="Python library for DIO Chacon wifi's protocol for shutters and switches"
HOMEPAGE="
  https://pypi.org/project/dio-chacon-wifi-api/
  Documentation, https://dio-chacon-wifi-api.readthedocs.io
  Repository, https://github.com/cnico/dio-chacon-wifi-api
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
