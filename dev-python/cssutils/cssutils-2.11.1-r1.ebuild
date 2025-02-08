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

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	cssselect; extra == "test"
	furo; extra == "doc"
	importlib-resources; python_version < "3.9" and extra == "test"
	jaraco.packaging>=9.3; extra == "doc"
	jaraco.test>=5.1; extra == "test"
	jaraco.tidelift>=1.4; extra == "doc"
	lxml; python_version < "3.11" and extra == "test"
	more-itertools
	pytest!=8.1.*,>=6; extra == "test"
	pytest-checkdocs>=2.4; extra == "test"
	pytest-cov; extra == "test"
	pytest-enabler>=2.2; extra == "test"
	pytest-mypy; extra == "test"
	pytest-ruff>=0.2.1; extra == "test"
	rst.linker>=1.9; extra == "doc"
	sphinx-lint; extra == "doc"
	sphinx>=3.5; extra == "doc"
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cssselect[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
