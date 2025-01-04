# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}
PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A Python library for interacting with Google Assistant API via text"
HOMEPAGE="
  https://pypi.org/project/gassist-text/
  Homepage, https://github.com/tronikos/gassist_text
  Bug Tracker, https://github.com/tronikos/gassist_text/issues
"
SRC_URI="https://github.com/tronikos/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	"
S="${WORKDIR}/${MY_P}"

distutils_enable_tests pytest

# RDEPEND could not be inserted in this ebuild
# Content: 