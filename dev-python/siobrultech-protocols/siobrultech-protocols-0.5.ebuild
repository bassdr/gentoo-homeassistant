# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 0.5.0)"
S="${WORKDIR}/${PN}-0.5.0"

DESCRIPTION="A Sans-I/O Python client library for Brultech Devices"
HOMEPAGE="
  https://pypi.org/project/siobrultech-protocols/
  Bug Reports, https://github.com/sdwilsh/siobrultech-protocols/issues
  Release Notes, https://github.com/sdwilsh/siobrultech-protocols/releases/
  Source, https://github.com/sdwilsh/siobrultech-protocols
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
