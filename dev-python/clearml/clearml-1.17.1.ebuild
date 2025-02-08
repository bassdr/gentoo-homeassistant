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

REQUIRES_DIST="
	Pillow>=4.1.1
	PyYAML>=3.12
	attrs>=18.0
	azure-storage-blob>=12.0.0; extra == "azure"
	backports.functools-lru-cache>=1.0.2; python_version < "3"
	boto3>=1.9; extra == "s3"
	enum34>=0.9; python_version < "3.6"
	fastapi>=0.115.2; extra == "router"
	furl>=2.0.0
	future>=0.16.0; python_version < "3"
	futures>=3.0.5; python_version < "3"
	google-cloud-storage>=1.13.2; extra == "gs"
	httpx>=0.27.2; extra == "router"
	jsonschema>=2.6.0
	numpy>=1.10
	pathlib2>=2.3.0
	psutil>=3.4.2
	pyjwt<2.0.0,>=1.6.4; python_version <= "3.5"
	pyjwt<2.10.0,>=2.4.0; python_version > "3.5"
	pyparsing>=2.0.3
	python-dateutil>=2.6.1
	referencing<0.40; python_version >= "3.8"
	requests>=2.20.0
	six>=1.16.0
	typing>=3.6.4; python_version < "3.5"
	urllib3>=1.21.1
	uvicorn>=0.31.1; extra == "router"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-18.0[${PYTHON_USEDEP}]
	azure? ( >=dev-python/azure-storage-blob-12.0.0[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.9[${PYTHON_USEDEP}] )
	router? ( >=dev-python/fastapi-0.115.2[${PYTHON_USEDEP}] )
	>=dev-python/furl-2.0.0[${PYTHON_USEDEP}]
	gs? ( >=dev-python/google-cloud-storage-1.13.2[${PYTHON_USEDEP}] )
	router? ( >=dev-python/httpx-0.27.2[${PYTHON_USEDEP}] )
	>=dev-python/jsonschema-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.10[${PYTHON_USEDEP}]
	>=dev-python/pathlib2-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-4.1.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.4.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.4.0[${PYTHON_USEDEP}] <dev-python/pyjwt-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.0.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	<dev-python/referencing-0.40[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.21.1[${PYTHON_USEDEP}]
	router? ( >=dev-python/uvicorn-0.31.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
