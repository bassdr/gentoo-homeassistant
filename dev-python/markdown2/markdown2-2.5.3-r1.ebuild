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

GENERATED_IUSE="all code-syntax-highlighting latex wavedrom"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	latex2mathml; python_version >= '3.8.1' and extra == 'all'
	latex2mathml; python_version >= '3.8.1' and extra == 'latex'
	pygments>=2.7.3; extra == 'all'
	pygments>=2.7.3; extra == 'code-syntax-highlighting'
	wavedrom; extra == 'all'
	wavedrom; extra == 'wavedrom'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/latex2mathml[${PYTHON_USEDEP}] )
	latex? ( dev-python/latex2mathml[${PYTHON_USEDEP}] )
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
