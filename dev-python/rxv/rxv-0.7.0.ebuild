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
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	black ; extra == 'testing'
	defusedxml
	flake8 ; extra == 'testing'
	mock ; extra == 'testing'
	pytest ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-timeout ; extra == 'testing'
	pytest-vcr ; extra == 'testing'
	requests
	requests-mock ; extra == 'testing'
	tox ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-vcr[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
