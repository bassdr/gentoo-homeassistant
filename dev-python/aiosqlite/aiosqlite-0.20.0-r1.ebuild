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

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( ~dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.5.3[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/attribution-1.7.0[${PYTHON_USEDEP}]
	~dev-python/black-24.2.0[${PYTHON_USEDEP}]
	~dev-python/coverage-7.4.1[toml,${PYTHON_USEDEP}]
	~dev-python/flake8-7.0.0[${PYTHON_USEDEP}]
	~dev-python/flake8-bugbear-24.2.6[${PYTHON_USEDEP}]
	~dev-python/flit-3.9.0[${PYTHON_USEDEP}]
	~dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
	~dev-python/ufmt-2.3.0[${PYTHON_USEDEP}]
	~dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
)"
