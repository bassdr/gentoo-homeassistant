# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/manuel/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	setuptools
	zope.testing; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
BDEPEND+="
	test? (
		dev-python/zope-testing[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	# unused rdep
	sed -e "/'setuptools'/d" -i setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	# tests are installed to site-packages but dependent data files
	# are not, so run them from src instead
	local -x PYTHONPATH=src
	"${EPYTHON}" -m unittest -vv manuel.tests.test_suite || die
}
