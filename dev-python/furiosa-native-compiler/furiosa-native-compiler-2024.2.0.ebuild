# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-native-compiler/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	furiosa-torch-ext==2024.2.0
	pytest-asyncio~=0.21; extra == 'test'
	pytest~=7.3; extra == 'test'
	pyyaml==6.0.1
	requests==2.29.0; extra == 'test'
	torch==2.4.1
	transformers==4.44.2; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/furiosa-torch-ext-2024.2.0[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	~dev-python/torch-2.4.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.3[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0*[${PYTHON_USEDEP}]
		~dev-python/requests-2.29.0[${PYTHON_USEDEP}]
		~dev-python/transformers-4.44.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
