# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cfn-lint/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="full graph junit sarif"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aws-sam-translator>=1.94.0
	jschema_to_python~=1.2.3; extra == 'full'
	jschema_to_python~=1.2.3; extra == 'sarif'
	jsonpatch
	junit-xml~=1.9; extra == 'full'
	junit-xml~=1.9; extra == 'junit'
	networkx<4,>=2.4
	pydot; extra == 'full'
	pydot; extra == 'graph'
	pyyaml>5.4
	regex
	sarif-om~=1.0.4; extra == 'full'
	sarif-om~=1.0.4; extra == 'sarif'
	sympy>=1.0.0
	typing_extensions
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aws-sam-translator-1.94.0[${PYTHON_USEDEP}]
	full? ( >=dev-python/jschema-to-python-1.2.3[${PYTHON_USEDEP}] =dev-python/jschema-to-python-1.2*[${PYTHON_USEDEP}] )
	sarif? ( >=dev-python/jschema-to-python-1.2.3[${PYTHON_USEDEP}] =dev-python/jschema-to-python-1.2*[${PYTHON_USEDEP}] )
	dev-python/jsonpatch[${PYTHON_USEDEP}]
	full? ( >=dev-python/junit-xml-1.9[${PYTHON_USEDEP}] =dev-python/junit-xml-1*[${PYTHON_USEDEP}] )
	junit? ( >=dev-python/junit-xml-1.9[${PYTHON_USEDEP}] =dev-python/junit-xml-1*[${PYTHON_USEDEP}] )
	>=dev-python/networkx-2.4[${PYTHON_USEDEP}] <dev-python/networkx-4[${PYTHON_USEDEP}]
	full? ( dev-python/pydot[${PYTHON_USEDEP}] )
	graph? ( dev-python/pydot[${PYTHON_USEDEP}] )
	>dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	full? ( >=dev-python/sarif-om-1.0.4[${PYTHON_USEDEP}] =dev-python/sarif-om-1.0*[${PYTHON_USEDEP}] )
	sarif? ( >=dev-python/sarif-om-1.0.4[${PYTHON_USEDEP}] =dev-python/sarif-om-1.0*[${PYTHON_USEDEP}] )
	>=dev-python/sympy-1.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aws-sam-translator-1.94.0[${PYTHON_USEDEP}]
	dev-python/jsonpatch[${PYTHON_USEDEP}]
	>=dev-python/jschema-to-python-1.2.3[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.0[${PYTHON_USEDEP}]
	dev-python/junit-xml[${PYTHON_USEDEP}]
	<dev-python/networkx-4[${PYTHON_USEDEP}]
	>dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
	>=dev-python/regex-2021.7.1[${PYTHON_USEDEP}]
	>=dev-python/sarif-om-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/sympy-1.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/defusedxml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	# unpin the deps
	sed -e 's:~=[0-9.]*::' -i pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		test/unit/module/test_template.py::TestTemplate::test_build_graph
		# requires git repo
		test/unit/module/maintenance/test_update_documentation.py::TestUpdateDocumentation::test_update_docs
		# Internet
		test/unit/module/formatters/test_formatters.py::TestFormatters::test_sarif_formatter
		test/unit/module/maintenance/test_update_resource_specs.py::TestUpdateResourceSpecs::test_update_resource_specs_python_3
		# TODO: it looks as if AWS_DEFAULT_REGION didn't work
		test/unit/module/core/test_run_cli.py::TestCli::test_bad_config
		test/unit/module/core/test_run_cli.py::TestCli::test_override_parameters
		test/unit/module/core/test_run_cli.py::TestCli::test_positional_template_parameters
		test/unit/module/core/test_run_cli.py::TestCli::test_template_config
		# different graphviz version?
		test/unit/module/template/test_template.py::TestTemplate::test_build_graph
	)

	# from tox.ini
	local -x AWS_DEFAULT_REGION=us-east-1
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
