# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

TEST_P=GitPython-${PV}
GITDB_P=gitdb-4.0.12
SMMAP_P=smmap-5.0.1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gitpython/"
SRC_URI+="
	test? (
		https://dev.gentoo.org/~mgorny/dist/${TEST_P}.gitbundle
		https://dev.gentoo.org/~mgorny/dist/${GITDB_P}.gitbundle
		https://dev.gentoo.org/~mgorny/dist/${SMMAP_P}.gitbundle
	)
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="doc test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	coverage[toml]; extra == 'test'
	ddt!=1.4.3,>=1.1.1; extra == 'test'
	gitdb<5,>=4.0.1
	mock; python_version < '3.8' and extra == 'test'
	mypy; extra == 'test'
	pre-commit; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-instafail; extra == 'test'
	pytest-mock; extra == 'test'
	pytest-sugar; extra == 'test'
	pytest>=7.3.1; extra == 'test'
	sphinx-autodoc-typehints; extra == 'doc'
	sphinx<7.2,>=7.1.2; extra == 'doc'
	sphinx_rtd_theme; extra == 'doc'
	typing-extensions; python_version < '3.11' and extra == 'test'
	typing-extensions>=3.7.4.3; python_version < '3.8'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/gitdb-4.0.1[${PYTHON_USEDEP}] <dev-python/gitdb-5[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-7.1.2[${PYTHON_USEDEP}] <dev-python/sphinx-7.2[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-vcs/git
	>=dev-python/gitdb-4.0.1[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		>=dev-python/ddt-1.1.1[${PYTHON_USEDEP}] !~dev-python/ddt-1.4.3[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-instafail[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		>=dev-python/ddt-1.1.1[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/typing-extensions[${PYTHON_USEDEP}]
		' 3.10)
	)
"

distutils_enable_tests pytest

src_test() {
	git config --global user.email "travis@ci.com" || die
	git config --global user.name "Travis Runner" || die

	git clone "${DISTDIR}/${TEST_P}.gitbundle" "${T}"/test || die
	git clone "${DISTDIR}/${GITDB_P}.gitbundle" \
		"${T}"/test/git/ext/gitdb || die
	git clone "${DISTDIR}/${SMMAP_P}.gitbundle" \
		"${T}"/test/git/ext/gitdb/gitdb/ext/smmap || die

	cd "${T}"/test || die
	git rev-parse HEAD > .git/refs/remotes/origin/master || die
	# this tries to fetch again
	sed -i -e '/git submodule/d' init-tests-after-clone.sh || die
	TRAVIS=1 ./init-tests-after-clone.sh || die
	cat test/fixtures/.gitconfig >> ~/.gitconfig || die

	distutils-r1_src_test
}

python_test() {
	local EPYTEST_DESELECT=(
		# performance tests are unreliable by design
		test/performance
		# unimportant and problematic
		test/test_installation.py
		# Internet
		test/test_quick_doc.py::QuickDoc::test_cloned_repo_object
		# TODO
		test/test_submodule.py::TestSubmodule::test_base_rw
		test/test_submodule.py::TestSubmodule::test_root_module
	)

	epytest -o addopts= test
}
