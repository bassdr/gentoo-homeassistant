# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PN="system-bridge-models"
SRC_URI="https://github.com/timmo001/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

DESCRIPTION="System Bridge Models"
HOMEPAGE="
  https://pypi.org/project/systembridgemodels/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	incremental>=24.7.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/incremental-24.7.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/incremental[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
