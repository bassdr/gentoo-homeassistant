# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for TP-Link Omada SDN Controller API (OC200/OC300/Software Controller)"
HOMEPAGE="
  https://pypi.org/project/tplink-omada-client/
  Homepage, https://github.com/MarkGodwin/tplink-omada-api
  Bug Tracker, https://github.com/MarkGodwin/tplink-omada-api/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]"
