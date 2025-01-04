# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="A collection of ASN.1-based protocols modules"
HOMEPAGE="
  https://pypi.org/project/pyasn1-modules/
  Source, https://github.com/pyasn1/pyasn1-modules
  Issues, https://github.com/pyasn1/pyasn1-modules/issues
  Changelog, https://github.com/pyasn1/pyasn1-modules/blob/master/CHANGES.txt
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/pyasn1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	<dev-python/pyasn1-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.4.6[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

PATCHES=(
	# https://github.com/pyasn1/pyasn1-modules/pull/22
	"${FILESDIR}/${P}-test.patch"
)

python_install_all() {
	distutils-r1_python_install_all
	insinto /usr/share/${P}
	doins -r tools
}
