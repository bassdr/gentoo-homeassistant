# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="libcst"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-cloud-bigtable/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/google-api-core-3.0.0_pre[grpc,${PYTHON_USEDEP}]
	!=dev-python/google-auth-2.24.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-core-3.0.0_pre[${PYTHON_USEDEP}]
	<dev-python/grpc-google-iam-v1-1.0.0_pre[${PYTHON_USEDEP}]
	libcst? ( >=dev-python/libcst-0.2.5[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}]
	!=dev-python/protobuf-4.21.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
