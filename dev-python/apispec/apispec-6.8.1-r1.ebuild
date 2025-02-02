# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apispec/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs marshmallow yaml"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/apispec[marshmallow,${PYTHON_USEDEP}] )
	marshmallow? ( >=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	docs? ( ~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-8.1.3[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-issues-5.0.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-3.0.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/bottle[${PYTHON_USEDEP}]
		>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/apispec[marshmallow,yaml,${PYTHON_USEDEP}]
	dev-python/apispec[tests,${PYTHON_USEDEP}]
	~dev-python/openapi-spec-validator-0.7.1[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	<dev-vcs/pre-commit-5.0[${PYTHON_USEDEP}]
)"
distutils_enable_sphinx docs \
	dev-python/sphinx-issues \
	dev-python/sphinx-rtd-theme

python_test() {
	local EPYTEST_DESELECT=(
		# requires unpackaged prance
		tests/test_ext_marshmallow_openapi.py::test_openapi_tools_validate_v2
		tests/test_ext_marshmallow_openapi.py::test_openapi_tools_validate_v3
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
