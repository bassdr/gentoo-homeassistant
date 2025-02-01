# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/subprocess-tee/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test-full"
REQUIRED_USE="test-full? ( test )"

# ansible-molecule is invoked as an executable so no need for PYTHON_USEDEP
GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/argparse-manpage[${PYTHON_USEDEP}] )
	docs? ( dev-python/cairosvg[${PYTHON_USEDEP}] )
	docs? ( dev-python/markdown-include[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-git-revision-date-localized-plugin[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material-extensions[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings-python[${PYTHON_USEDEP}] )
	docs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	docs? ( dev-python/pymdown-extensions[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/setuptools-scm-7.0.0[${PYTHON_USEDEP}]
	test? (
		dev-python/enrich[${PYTHON_USEDEP}]
		test-full? ( app-admin/ansible-molecule )
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/enrich-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/molecule-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.12.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-plus-0.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-xdist-2.3.0[${PYTHON_USEDEP}]
)"

python_test() {
	local EPYTEST_DESELECT=()

	if ! use test-full; then
		EPYTEST_DESELECT+=(
			test/test_func.py::test_molecule
		)
	fi

	epytest
}
# RDEPEND could not be inserted in this ebuild
