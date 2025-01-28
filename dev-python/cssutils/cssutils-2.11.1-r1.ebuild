# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cssutils/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	test? ( dev-python/cssselect[${PYTHON_USEDEP}] )
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	test? ( >=dev-python/jaraco-test-5.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	test? ( !=dev-python/pytest-8.1*[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/more-itertools[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/cssselect[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.1[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/lxml[${PYTHON_USEDEP}]
		' 3.10)
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# network
		encutils/__init__.py::encutils
		examples/website.py::examples.website.logging
	)
	local EPYTEST_IGNORE=(
		# path mismatch with "parse" package
		examples/parse.py
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -m "not network"
}
