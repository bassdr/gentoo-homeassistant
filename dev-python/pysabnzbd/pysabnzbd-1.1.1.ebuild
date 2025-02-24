# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python wrapper for SABnzbd API"
HOMEPAGE="
  https://pypi.org/project/pysabnzbd/
"
COMMIT="8e6cd1869c8cc99a4560ea1b178f0a1efd89e460"
SRC_URI="https://github.com/jeradM/pysabnzbd/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp (<4.0,>=3.6.1)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
