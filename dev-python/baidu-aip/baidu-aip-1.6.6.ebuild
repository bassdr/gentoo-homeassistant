# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 1.6.6.0)"
S="${WORKDIR}/${PN}-1.6.6.0"

DESCRIPTION="Baidu AIP SDK"
HOMEPAGE="
  https://pypi.org/project/baidu-aip/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	Pillow
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
