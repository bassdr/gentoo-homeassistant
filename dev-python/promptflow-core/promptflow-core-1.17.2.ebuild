# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="azureml-serving"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/promptflow-core/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	azureml-serving? ( <dev-python/azure-ai-ml-2.0.0[${PYTHON_USEDEP}] )
	azureml-serving? ( <dev-python/azure-identity-2.0.0[${PYTHON_USEDEP}] )
	azureml-serving? ( <dev-python/azureml-ai-monitoring-1.0.0[${PYTHON_USEDEP}] )
	dev-python/docstring-parser[${PYTHON_USEDEP}]
	<dev-python/fastapi-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
	<dev-python/flask-4.0.0[${PYTHON_USEDEP}]
	<dev-python/jsonschema-5.0.0[${PYTHON_USEDEP}]
	~dev-python/promptflow-tracing-1.17.2[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	<dev-python/ruamel-yaml-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
