# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with the met.no api"
HOMEPAGE="
  https://pypi.org/project/pymetno/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp>=3.0.6
	async-timeout>=3.0.0
	xmltodict
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/PyMetno"

distutils_enable_tests pytest
