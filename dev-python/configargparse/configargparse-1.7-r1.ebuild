# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=ConfigArgParse-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/configargparse/"
SRC_URI="
	https://github.com/bw2/ConfigArgParse/archive/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="yaml"
IUSE="${GENERATED_IUSE}"

RDEPEND=""

distutils_enable_tests unittest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

PATCHES=(
	# https://github.com/bw2/ConfigArgParse/pull/295
	"${FILESDIR}/${P}-py313.patch"
)

src_test() {
	local -x COLUMNS=80
	distutils-r1_src_test
}
