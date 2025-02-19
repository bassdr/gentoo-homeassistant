# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Retry code until it succeeds"
HOMEPAGE="
  https://pypi.org/project/tenacity/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"

REQUIRES_DIST="
	pytest; extra == 'test'
	reno; extra == 'doc'
	sphinx; extra == 'doc'
	tornado>=4.5; extra == 'test'
	typeguard; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/reno[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND+="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		>=dev-python/tornado-6.4-r1[${PYTHON_USEDEP}]
		dev-python/typeguard[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/tornado-4.5[${PYTHON_USEDEP}]
		dev-python/typeguard[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# fragile to timing
		tests/test_asyncio.py::TestContextManager::test_sleeps
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
