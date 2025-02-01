# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-trio/"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/outcome-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
	>=dev-python/trio-0.22.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/outcome-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
	>=dev-python/trio-0.22.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/hypothesis-3.64[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source \
	dev-python/attrs \
	dev-python/sphinx-rtd-theme \
	dev-python/sphinxcontrib-trio

python_prepare_all() {
	local PATCHES=(
		# https://github.com/python-trio/pytest-trio/pull/135
		"${FILESDIR}/${P}-test.patch"
	)

	# Defining 'pytest_plugins' in a non-top-level conftest is no longer supported:
	mv pytest_trio/_tests/conftest.py conftest.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	# disable autoloading pytest-asyncio in nested pytest calls
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# since we disabled autoloading, force loading pytest-trio
	local -x PYTEST_PLUGINS=pytest_trio.plugin
	epytest
}
