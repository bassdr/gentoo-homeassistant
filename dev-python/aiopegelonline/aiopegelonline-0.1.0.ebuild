# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Asynchronous library to retrieve data from PEGELONLINE."
HOMEPAGE="
  https://pypi.org/project/aiopegelonline/
  homepage, https://github.com/mib1185/aiopegelonline
  repository, https://github.com/mib1185/aiopegelonline
"
SRC_URI="https://github.com/mib1185/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
