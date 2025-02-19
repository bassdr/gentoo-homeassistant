# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="graph profile"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dill/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	gprof2dot>=2022.7.29; extra == 'profile'
	objgraph>=1.7.2; extra == 'graph'
"
GENERATED_RDEPEND="${RDEPEND}
	profile? ( >=dev-python/gprof2dot-2022.7.29[${PYTHON_USEDEP}] )
	graph? ( >=dev-python/objgraph-1.7.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	"${EPYTHON}" -m dill.tests || die
}
