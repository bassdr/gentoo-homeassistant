# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="pybbox-0.0.5"
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PYPI_PN} alpha .zip)"
S="${WORKDIR}/${PYPI_PN}-alpha"

MY_PV=${PV/_alpha0/-alpha}
DESCRIPTION="a simple python3 library for the Bouygues BBox Routeur API"
HOMEPAGE="
  https://pypi.org/project/pybbox/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

REQUIRES_DIST="
	netaddr
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
