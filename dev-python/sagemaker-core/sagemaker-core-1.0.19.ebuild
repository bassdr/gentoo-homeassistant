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

GENERATED_DEPEND="${RDEPEND}
	codegen? ( <dev-python/black-25.0.0[${PYTHON_USEDEP}] )
	<dev-python/boto3-2.0.0[${PYTHON_USEDEP}]
	<dev-python/importlib-metadata-7.0[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	<dev-python/mock-5.0[${PYTHON_USEDEP}]
	codegen? ( <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	<dev-python/platformdirs-5.0.0[${PYTHON_USEDEP}]
	<dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	codegen? ( <dev-python/pylint-4.0.0[${PYTHON_USEDEP}] )
	codegen? ( <dev-python/pytest-9.0.0[${PYTHON_USEDEP}] )
	<dev-python/pyyaml-7.0[${PYTHON_USEDEP}]
	<dev-python/rich-14.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
