# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="mapbox_earcut_python-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mapbox-earcut/"
SRC_URI="
	https://github.com/skogler/mapbox_earcut_python/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	dev-python/numpy:=[${PYTHON_USEDEP}]
"
REQUIRES_DIST="
	numpy
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	${DEPEND}
"
BDEPEND="
	>=dev-python/pybind11-2.12[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

DOCS=( CHANGELOG.md README.md )
