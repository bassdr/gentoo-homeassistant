# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="fastembed fastembed-gpu"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/qdrant-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fastembed-gpu==0.5.1; extra == 'fastembed-gpu'
	fastembed==0.5.1; extra == 'fastembed'
	grpcio-tools>=1.41.0
	grpcio>=1.41.0
	httpx[http2]>=0.20.0
	numpy<2.1.0,>=1.21; python_version < '3.10'
	numpy>=1.21; python_version >= '3.10' and python_version < '3.12'
	numpy>=1.26; python_version >= '3.12' and python_version < '3.13'
	numpy>=2.1.0; python_version >= '3.13'
	portalocker<3.0.0,>=2.7.0
	pydantic>=1.10.8
	urllib3<3,>=1.26.14
"
GENERATED_RDEPEND="${RDEPEND}
	fastembed? ( ~dev-python/fastembed-0.5.1[${PYTHON_USEDEP}] )
	fastembed-gpu? ( ~dev-python/fastembed-gpu-0.5.1[${PYTHON_USEDEP}] )
	>=dev-python/grpcio-1.41.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-tools-1.41.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.20.0[http2,${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/numpy-1.26[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}] <dev-python/portalocker-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.14[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
