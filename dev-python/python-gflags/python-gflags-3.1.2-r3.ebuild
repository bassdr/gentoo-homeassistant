# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-gflags/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}"/${PN}-3.1.1-script-install.patch )

python_test() {
	# note: each test needs to be run separately, otherwise they fail
	"${EPYTHON}" -m gflags._helpers_test -v || die
	"${EPYTHON}" -m gflags.flags_formatting_test -v || die
	"${EPYTHON}" -m gflags.flags_unicode_literals_test -v || die
}
