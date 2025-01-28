# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="jaraco.vcs"
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco.vcs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/jaraco-path[${PYTHON_USEDEP}]
	dev-python/jaraco-versioning[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	test? ( dev-python/pygments[${PYTHON_USEDEP}] )
	test? ( !=dev-python/pytest-8.1.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-home[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tempora[${PYTHON_USEDEP}]
	test? ( dev-python/types-python-dateutil[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
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

python_test() {
	local EPYTEST_DESELECT=(
		# assumes running inside the git repo
		jaraco/vcs/__init__.py::jaraco.vcs
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p home -p jaraco.vcs.fixtures
}
