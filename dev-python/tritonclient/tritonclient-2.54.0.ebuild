# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all cuda grpc http"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tritonclient/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	all? ( <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}] )
	http? ( <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}] )
	all? ( dev-python/cuda-python[${PYTHON_USEDEP}] )
	cuda? ( dev-python/cuda-python[${PYTHON_USEDEP}] )
	all? ( >=dev-python/geventhttpclient-2.3.3[${PYTHON_USEDEP}] )
	http? ( >=dev-python/geventhttpclient-2.3.3[${PYTHON_USEDEP}] )
	all? ( <dev-python/grpcio-1.68[${PYTHON_USEDEP}] )
	grpc? ( <dev-python/grpcio-1.68[${PYTHON_USEDEP}] )
	<dev-python/numpy-2[${PYTHON_USEDEP}]
	all? ( <dev-python/numpy-2[${PYTHON_USEDEP}] )
	grpc? ( <dev-python/numpy-2[${PYTHON_USEDEP}] )
	http? ( <dev-python/numpy-2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/packaging-14.1[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/packaging-14.1[${PYTHON_USEDEP}] )
	all? ( <dev-python/protobuf-6.0_pre[${PYTHON_USEDEP}] )
	grpc? ( <dev-python/protobuf-6.0_pre[${PYTHON_USEDEP}] )
	>=dev-python/python-rapidjson-0.9.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/python-rapidjson-0.9.1[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/python-rapidjson-0.9.1[${PYTHON_USEDEP}] )
	http? ( >=dev-python/python-rapidjson-0.9.1[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-2.0.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
