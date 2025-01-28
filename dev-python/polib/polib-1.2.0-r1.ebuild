# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/polib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# <sys-devel/gettext-0.22: https://github.com/izimobil/polib/issues/150
BDEPEND="
	test? (
		<sys-devel/gettext-0.22
	)
"

distutils_enable_sphinx docs

PATCHES=(
	"${FILESDIR}"/${PN}-1.0.7-BE-test.patch
)

python_test() {
	"${EPYTHON}" tests/tests.py -v || die "Tests failed under ${EPYTHON}"
}
