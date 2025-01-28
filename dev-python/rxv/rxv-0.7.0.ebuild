# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers"
HOMEPAGE="
  https://pypi.org/project/rxv/
  Source, https://github.com/wuub/rxv
  Tracker, https://github.com/wuub/rxv/issues
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	testing? ( dev-python/black[${PYTHON_USEDEP}] )
	dev-python/defusedxml[${PYTHON_USEDEP}]
	testing? ( dev-python/flake8[${PYTHON_USEDEP}] )
	testing? ( dev-python/mock[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-vcr[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	testing? ( dev-python/requests-mock[${PYTHON_USEDEP}] )
	testing? ( dev-python/tox[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
