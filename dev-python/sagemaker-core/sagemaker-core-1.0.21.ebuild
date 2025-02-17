# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="codegen"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sagemaker-core/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML<7.0,>=6.0
	black<25.0.0,>=24.3.0; extra == 'codegen'
	boto3<2.0.0,>=1.35.75
	importlib-metadata<7.0,>=1.4.0
	jsonschema<5.0.0
	mock<5.0,>4.0
	pandas<3.0.0,>=2.0.0; extra == 'codegen'
	platformdirs<5.0.0,>=4.0.0
	pydantic<3.0.0,>=2.0.0
	pylint<4.0.0,>=3.0.0; extra == 'codegen'
	pytest<9.0.0,>=8.0.0; extra == 'codegen'
	rich<14.0.0,>=13.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	codegen? ( >=dev-python/black-24.3.0[${PYTHON_USEDEP}] <dev-python/black-25.0.0[${PYTHON_USEDEP}] )
	>=dev-python/boto3-1.35.75[${PYTHON_USEDEP}] <dev-python/boto3-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-1.4.0[${PYTHON_USEDEP}] <dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	>dev-python/mock-4.0[${PYTHON_USEDEP}] <dev-python/mock-5.0[${PYTHON_USEDEP}]
	codegen? ( >=dev-python/pandas-2.0.0[${PYTHON_USEDEP}] <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}] <dev-python/platformdirs-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	codegen? ( >=dev-python/pylint-3.0.0[${PYTHON_USEDEP}] <dev-python/pylint-4.0.0[${PYTHON_USEDEP}] )
	codegen? ( >=dev-python/pytest-8.0.0[${PYTHON_USEDEP}] <dev-python/pytest-9.0.0[${PYTHON_USEDEP}] )
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}] <dev-python/pyyaml-7.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}] <dev-python/rich-14.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
