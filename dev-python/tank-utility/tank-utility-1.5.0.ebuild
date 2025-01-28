# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A smart propane tank monitor."
HOMEPAGE="
  https://pypi.org/project/tank-utility/
"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/krismolendyke/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="dev test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev? ( dev-python/bumpversion[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/mock[${PYTHON_USEDEP}] )
	dev? ( dev-python/pylint[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	test? ( dev-python/responses[${PYTHON_USEDEP}] )
	test? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev? ( dev-python/yapf[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
