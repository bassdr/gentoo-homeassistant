# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/markdown2/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="all code-syntax-highlighting wavedrom"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/pygments-2.7.3[${PYTHON_USEDEP}] )
	code-syntax-highlighting? ( >=dev-python/pygments-2.7.3[${PYTHON_USEDEP}] )
	all? ( dev-python/wavedrom[${PYTHON_USEDEP}] )
	wavedrom? ( dev-python/wavedrom[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pygments-2.7.3[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_test() {
	cd test || die
	"${EPYTHON}" -m unittest test_markdown2.py -v ||
		die "Tests fail with ${EPYTHON}"
}
