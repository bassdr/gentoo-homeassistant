# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyterlab-server/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs openapi"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( dev-python/autodoc-traits[${PYTHON_USEDEP}] )
	>=dev-python/babel-2.10[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	docs? ( <dev-python/jinja2-3.2.0[${PYTHON_USEDEP}] )
	>=dev-python/json5-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	<dev-python/jupyter-server-3[${PYTHON_USEDEP}]
	docs? ( <dev-python/mistune-4[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	openapi? ( ~dev-python/openapi-core-0.18.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	openapi? ( dev-python/ruamel-yaml[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( >dev-python/sphinxcontrib-openapi-0.8[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/babel-2.10[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/json5-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.18.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-1.21[${PYTHON_USEDEP}]
	<dev-python/jupyter-server-3[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/jupyter-server[${PYTHON_USEDEP}]
		>=dev-python/openapi-core-0.18[${PYTHON_USEDEP}]
		>=dev-python/openapi-spec-validator-0.6[${PYTHON_USEDEP}]
		dev-python/pytest-jupyter[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/ruamel-yaml[${PYTHON_USEDEP}]
		dev-python/strict-rfc3339[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/hatch[${PYTHON_USEDEP}]
	dev-python/ipykernel[${PYTHON_USEDEP}]
	~dev-python/openapi-core-0.18.0[${PYTHON_USEDEP}]
	<dev-python/openapi-spec-validator-0.8.0[${PYTHON_USEDEP}]
	<dev-python/pytest-8[${PYTHON_USEDEP}]
	dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	>=dev-python/pytest-jupyter-0.6.2[server,${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	dev-python/requests-mock[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}]
	dev-python/strict-rfc3339[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
)"
# TODO: package autodoc_traits
#distutils_enable_sphinx docs/source dev-python/pydata-sphinx-theme dev-python/myst-parser

python_test() {
	local EPYTEST_IGNORE=(
		tests/test_translation_api.py
	)

	EPYTEST_DESELECT=(
		# Fails if terminal not available
		tests/test_labapp.py::test_page_config
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p pytest_tornasync.plugin -p timeout
}
