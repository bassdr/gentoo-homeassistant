# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-${P}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/phonenumbers/"
SRC_URI="
	https://github.com/daviddrysdale/python-phonenumbers/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}/python

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/protobuf[${PYTHON_USEDEP}]
	)
"

DOCS=( ../README.md )

python_test() {
	"${EPYTHON}" testwrapper.py -v || die "Tests failed with ${EPYTHON}"
}
