# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mapbox-vector-tile/"
SRC_URI="https://github.com/tilezen/mapbox-vector-tile/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="proj"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	protobuf<6.0.0,>=5.26.1
	pyclipper<2.0.0,>=1.3.0
	pyproj<4.0.0,>=3.4.1; extra == 'proj'
	shapely<3.0.0,>=2.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/protobuf-5.26.1[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyclipper-1.3.0[${PYTHON_USEDEP}] <dev-python/pyclipper-2.0.0[${PYTHON_USEDEP}]
	proj? ( >=dev-python/pyproj-3.4.1[${PYTHON_USEDEP}] <dev-python/pyproj-4.0.0[${PYTHON_USEDEP}] )
	>=dev-python/shapely-2.0.0[${PYTHON_USEDEP}] <dev-python/shapely-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/protobuf[${PYTHON_USEDEP}]
	>=dev-python/pyclipper-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyproj-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/shapely-2.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

src_prepare() {
	# don't install into top-level
	sed -Ei '/include = \[/,/\]/ { /(README|CHANGELOG)/d }' pyproject.toml || die
	# relax the dep
	sed -i -e '/protobuf/s:\^[0-9.]*:*:' pyproject.toml || die
	distutils-r1_src_prepare
}
