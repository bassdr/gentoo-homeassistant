# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

DESCRIPTION="File type identification using libmagic"
HOMEPAGE="
  https://pypi.org/project/python-magic/
"
SRC_URI="
	https://github.com/ahupp/python-magic/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	sys-apps/file[-python]
"
BDEPEND="
	test? (
		sys-apps/file
	)
"

PATCHES=(
	# upstream git backports
	"${FILESDIR}"/${P}-test.patch
)

distutils_enable_tests unittest

python_test() {
	local -x LC_ALL=en_US.UTF-8
	eunittest -p "*_test.py"
}
