# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all azure azureml-serving executable executor-service"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/promptflow/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	promptflow-azure==1.17.2; extra == "all"
	promptflow-azure==1.17.2; extra == "azure"
	promptflow-core==1.17.2
	promptflow-core[azureml-serving]==1.17.2; extra == "azureml-serving"
	promptflow-core[executor-service]==1.17.2; extra == "all"
	promptflow-core[executor-service]==1.17.2; extra == "executor-service"
	promptflow-devkit==1.17.2
	promptflow-devkit[all]==1.17.2; extra == "all"
	promptflow-devkit[executable]==1.17.2; extra == "executable"
	promptflow-tracing==1.17.2
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( ~dev-python/promptflow-azure-1.17.2[${PYTHON_USEDEP}] )
	azure? ( ~dev-python/promptflow-azure-1.17.2[${PYTHON_USEDEP}] )
	~dev-python/promptflow-core-1.17.2[${PYTHON_USEDEP}]
	all? ( ~dev-python/promptflow-core-1.17.2[executor-service,${PYTHON_USEDEP}] )
	azureml-serving? ( ~dev-python/promptflow-core-1.17.2[azureml-serving,${PYTHON_USEDEP}] )
	executor-service? ( ~dev-python/promptflow-core-1.17.2[executor-service,${PYTHON_USEDEP}] )
	~dev-python/promptflow-devkit-1.17.2[${PYTHON_USEDEP}]
	all? ( ~dev-python/promptflow-devkit-1.17.2[all,${PYTHON_USEDEP}] )
	executable? ( ~dev-python/promptflow-devkit-1.17.2[executable,${PYTHON_USEDEP}] )
	~dev-python/promptflow-tracing-1.17.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
