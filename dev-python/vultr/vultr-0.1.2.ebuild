# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} ${PV} .zip)"

DESCRIPTION="Vultr.com API Client"
HOMEPAGE="
  https://pypi.org/project/vultr/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
