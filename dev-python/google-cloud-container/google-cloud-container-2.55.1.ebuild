# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-container/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1
	google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1
	proto-plus<2.0.0dev,>=1.22.3
	proto-plus<2.0.0dev,>=1.25.0; python_version >= "3.13"
	protobuf!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0dev,>=3.20.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/google-api-core-1.34.1[grpc,${PYTHON_USEDEP}] <dev-python/google-api-core-3.0.0_pre[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.0*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.1*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.10*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.2*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.3*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.4*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.5*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.6*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.7*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.8*[grpc,${PYTHON_USEDEP}] !=dev-python/google-api-core-2.9*[grpc,${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}] <dev-python/google-auth-3.0.0_pre[${PYTHON_USEDEP}] !~dev-python/google-auth-2.24.0[${PYTHON_USEDEP}] !~dev-python/google-auth-2.25.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}] <dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}] <dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0_pre[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.0[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
