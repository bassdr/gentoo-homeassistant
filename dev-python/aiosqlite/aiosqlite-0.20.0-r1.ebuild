# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1 pypi

DESCRIPTION="asyncio bridge to the standard sqlite3 module"
HOMEPAGE="
  https://pypi.org/project/aiosqlite/
  Documentation, https://aiosqlite.omnilib.dev
  Github, https://github.com/omnilib/aiosqlite
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	attribution==1.7.0 ; extra == "dev"
	black==24.2.0 ; extra == "dev"
	coverage[toml]==7.4.1 ; extra == "dev"
	flake8-bugbear==24.2.6 ; extra == "dev"
	flake8==7.0.0 ; extra == "dev"
	flit==3.9.0 ; extra == "dev"
	mypy==1.8.0 ; extra == "dev"
	sphinx-mdinclude==0.5.3 ; extra == "docs"
	sphinx==7.2.6 ; extra == "docs"
	typing_extensions >= 4.0
	ufmt==2.3.0 ; extra == "dev"
	usort==1.0.8.post1 ; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( ~dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.5.3[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/attribution-1.7.0[${PYTHON_USEDEP}]
		~dev-python/black-24.2.0[${PYTHON_USEDEP}]
		~dev-python/coverage-7.4.1[toml,${PYTHON_USEDEP}]
		~dev-python/flake8-7.0.0[${PYTHON_USEDEP}]
		~dev-python/flake8-bugbear-24.2.6[${PYTHON_USEDEP}]
		~dev-python/flit-3.9.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
		~dev-python/ufmt-2.3.0[${PYTHON_USEDEP}]
		~dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
