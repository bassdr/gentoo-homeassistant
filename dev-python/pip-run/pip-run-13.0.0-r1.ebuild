# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pip-run/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	autocommand
	flit-core; extra == 'test'
	furo; extra == 'doc'
	importlib-resources; python_version < '3.9'
	jaraco.context
	jaraco.env
	jaraco.functools>=3.7
	jaraco.packaging>=9.3; extra == 'doc'
	jaraco.path; extra == 'test'
	jaraco.test>=5.3; extra == 'test'
	jaraco.text
	jaraco.tidelift>=1.4; extra == 'doc'
	more-itertools>=8.3
	nbformat; extra == 'test'
	packaging
	path>=15.1
	pip>=19.3
	platformdirs
	pygments; extra == 'test'
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-enabler>=2.2; extra == 'test'
	pytest-mypy; extra == 'test'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'test'
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
	tomli; python_version < '3.11'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/autocommand[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	dev-python/jaraco-env[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.7[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/jaraco-text[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	>=dev-python/more-itertools-8.3[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/path-15.1[${PYTHON_USEDEP}]
	>=dev-python/pip-19.3[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/autocommand[${PYTHON_USEDEP}]
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	dev-python/jaraco-env[${PYTHON_USEDEP}]
	>=dev-python/jaraco-functools-3.7[${PYTHON_USEDEP}]
	dev-python/jaraco-text[${PYTHON_USEDEP}]
	>=dev-python/more-itertools-8.3[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/path-15.1[${PYTHON_USEDEP}]
	>=dev-python/pip-19.3[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tomli[${PYTHON_USEDEP}]
	' 3.10)
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flit-core[${PYTHON_USEDEP}]
		dev-python/jaraco-path[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.3[${PYTHON_USEDEP}]
		dev-python/nbformat[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/flit-core[${PYTHON_USEDEP}]
		dev-python/jaraco-path[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.3[${PYTHON_USEDEP}]
		dev-python/nbformat[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest -m "not network"
}
