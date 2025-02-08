# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="azure"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/promptflow-tools/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-mgmt-cognitiveservices==13.5.0; extra == "azure"
	google-search-results==2.4.1
	openai>=1.0.0
	promptflow>=1.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	azure? ( ~dev-python/azure-mgmt-cognitiveservices-13.5.0[${PYTHON_USEDEP}] )
	~dev-python/google-search-results-2.4.1[${PYTHON_USEDEP}]
	>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/promptflow-1.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
