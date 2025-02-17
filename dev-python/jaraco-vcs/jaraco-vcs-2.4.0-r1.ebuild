# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco-vcs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	furo; extra == 'doc'
	jaraco.classes
	jaraco.packaging>=9.3; extra == 'doc'
	jaraco.path
	jaraco.versioning
	more-itertools
	packaging
	pygments; extra == 'test'
	pytest!=8.1.1,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-enabler>=2.2; extra == 'test'
	pytest-home; extra == 'test'
	pytest-mypy; extra == 'test'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'test'
	python-dateutil
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
	tempora
	types-python-dateutil; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/jaraco-path[${PYTHON_USEDEP}]
	dev-python/jaraco-versioning[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tempora[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	dev-python/jaraco-path[${PYTHON_USEDEP}]
	dev-python/jaraco-versioning[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/tempora[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-home[${PYTHON_USEDEP}]
		dev-vcs/git
	)
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-home[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
		dev-python/types-python-dateutil[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# assumes running inside the git repo
		jaraco/vcs/__init__.py::jaraco.vcs
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p home -p jaraco.vcs.fixtures
}
