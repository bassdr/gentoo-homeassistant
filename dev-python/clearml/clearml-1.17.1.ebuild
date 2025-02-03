# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="azure gs router s3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1
SRC_URI="https://github.com/clearml/clearml/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/clearml/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-18.0[${PYTHON_USEDEP}]
	azure? ( >=dev-python/azure-storage-blob-12.0.0[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.9[${PYTHON_USEDEP}] )
	>=dev-python/enum34-0.9[${PYTHON_USEDEP}]
	router? ( >=dev-python/fastapi-0.115.2[${PYTHON_USEDEP}] )
	>=dev-python/furl-2.0.0[${PYTHON_USEDEP}]
	gs? ( >=dev-python/google-cloud-storage-1.13.2[${PYTHON_USEDEP}] )
	router? ( >=dev-python/httpx-0.27.2[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
	>=dev-python/pathlib2-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-4.1.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.4.2[${PYTHON_USEDEP}]
	<dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.0.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.21.1[${PYTHON_USEDEP}]
	router? ( >=dev-python/uvicorn-0.31.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
