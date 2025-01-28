# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python-lsp-jsonrpc/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/pycodestyle[${PYTHON_USEDEP}] )
	test? ( dev-python/pyflakes[${PYTHON_USEDEP}] )
	test? ( dev-python/pylint[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/ujson-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/ujson-3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pycodestyle[${PYTHON_USEDEP}]
		dev-python/pyflakes[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x TZ=UTC
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts=
}
