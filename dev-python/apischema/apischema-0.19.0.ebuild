# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="JSON (de)serialization, GraphQL and JSON schema generation using Python typing."
HOMEPAGE="
  https://pypi.org/project/apischema/
  Repository, https://github.com/wyfo/apischema
  Documentation, https://wyfo.github.io/apischema
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="examples graphql"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	examples? ( dev-python/attrs[${PYTHON_USEDEP}] )
	examples? ( dev-python/bson[${PYTHON_USEDEP}] )
	examples? ( dev-python/docstring-parser[${PYTHON_USEDEP}] )
	examples? ( >=dev-python/graphql-core-3.0.0[${PYTHON_USEDEP}] )
	graphql? ( >=dev-python/graphql-core-3.0.0[${PYTHON_USEDEP}] )
	examples? ( dev-python/orjson[${PYTHON_USEDEP}] )
	examples? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	examples? ( dev-python/pytest[${PYTHON_USEDEP}] )
	examples? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND} dev-python/graphql-core[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
