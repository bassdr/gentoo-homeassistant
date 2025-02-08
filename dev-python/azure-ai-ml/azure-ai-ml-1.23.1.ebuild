# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="designer mount"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-ai-ml/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-common>=1.1
	azure-core>=1.23.0
	azure-mgmt-core>=1.3.0
	azure-storage-blob>=12.10.0
	azure-storage-file-datalake>=12.2.0
	azure-storage-file-share
	azureml-dataprep-rslex>=2.22.0; extra == "mount"
	colorama
	isodate
	jsonschema>=4.0.0
	marshmallow>=3.5
	mldesigner; extra == "designer"
	msrest>=0.6.18
	opencensus-ext-azure
	opencensus-ext-logging
	pydash>=6.0.0
	pyjwt
	pyyaml>=5.1.0
	strictyaml
	tqdm
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-common-1.1[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.23.0[${PYTHON_USEDEP}]
	>=dev-python/azure-mgmt-core-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/azure-storage-blob-12.10.0[${PYTHON_USEDEP}]
	>=dev-python/azure-storage-file-datalake-12.2.0[${PYTHON_USEDEP}]
	dev-python/azure-storage-file-share[${PYTHON_USEDEP}]
	mount? ( >=dev-python/azureml-dataprep-rslex-2.22.0[${PYTHON_USEDEP}] )
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/isodate[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.5[${PYTHON_USEDEP}]
	designer? ( dev-python/mldesigner[${PYTHON_USEDEP}] )
	>=dev-python/msrest-0.6.18[${PYTHON_USEDEP}]
	dev-python/opencensus-ext-azure[${PYTHON_USEDEP}]
	dev-python/opencensus-ext-logging[${PYTHON_USEDEP}]
	>=dev-python/pydash-6.0.0[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1.0[${PYTHON_USEDEP}]
	dev-python/strictyaml[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
