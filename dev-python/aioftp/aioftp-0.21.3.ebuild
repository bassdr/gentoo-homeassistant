# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="ftp client/server for asyncio"
HOMEPAGE="
  https://pypi.org/project/aioftp/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="socks test"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	async-timeout ; extra == 'tests'
	pytest ; extra == 'tests'
	pytest-asyncio ; extra == 'tests'
	pytest-cov ; extra == 'tests'
	siosocks (>=0.2.0) ; extra == 'socks'
	siosocks ; extra == 'tests'
	trustme ; extra == 'tests'
"
GENERATED_RDEPEND="${RDEPEND}
	socks? ( >=dev-python/siosocks-0.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/async-timeout[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/siosocks[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
