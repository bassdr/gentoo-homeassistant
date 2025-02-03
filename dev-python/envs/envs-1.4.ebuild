# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Easy access of environment variables from Python with support for strings, booleans, list, tuples, and dicts."
HOMEPAGE="
  https://pypi.org/project/envs/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} cli test"
RESTRICT="!test? ( test )"

# missing DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	cli? ( >=dev-python/click-8.0.3[cli,${PYTHON_USEDEP}] )
	cli? ( >=dev-python/jinja2-3.0.3[cli,${PYTHON_USEDEP}] )
	cli? ( >=dev-python/terminaltables-3.1.10[cli,${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND} cli? (
			  >=dev-python/jinja-3.0.3[${PYTHON_USEDEP}]
			  >=dev-python/click-8.0.3[${PYTHON_USEDEP}]
			  >=dev-python/terminaltables-3.1.10[${PYTHON_USEDEP}]
			  )"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
