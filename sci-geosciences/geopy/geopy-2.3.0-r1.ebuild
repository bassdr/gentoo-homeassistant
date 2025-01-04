# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python Geocoding Toolbox"
HOMEPAGE="
  https://pypi.org/project/geopy/
"
SRC_URI="https://github.com/geopy/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
# Need geocoding service to test
RESTRICT="test"

GENERATED_DEPEND="
	dev-python/geographiclib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} "
DEPEND="${RDEPEND}"
