# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=python-api-core-${PV}
DESCRIPTION="Google API client core library"
HOMEPAGE="
  https://pypi.org/project/google-api-core/
  Documentation, https://googleapis.dev/python/google-api-core/latest/
  Repository, https://github.com/googleapis/python-api-core
"
SRC_URI="
	https://github.com/googleapis/python-api-core/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="async-rest grpc grpcgcp grpcio-gcp"
IUSE="${GENERATED_IUSE} +grpc"
REQUIRED_USE+=" test? ( grpc )"

REQUIRES_DIST="
	google-auth<3.0.dev0,>=2.14.1
	google-auth[aiohttp]<3.0.dev0,>=2.35.0; extra == 'async-rest'
	googleapis-common-protos<2.0.dev0,>=1.56.2
	grpcio-gcp<1.0.dev0,>=0.2.2; extra == 'grpcgcp'
	grpcio-gcp<1.0.dev0,>=0.2.2; extra == 'grpcio-gcp'
	grpcio-status<2.0.dev0,>=1.33.2; extra == 'grpc'
	grpcio-status<2.0.dev0,>=1.49.1; python_version >= '3.11' and extra == 'grpc'
	grpcio<2.0dev,>=1.33.2; extra == 'grpc'
	grpcio<2.0dev,>=1.49.1; python_version >= '3.11' and extra == 'grpc'
	proto-plus<2.0.0dev,>=1.22.3
	proto-plus<2.0.0dev,>=1.25.0; python_version >= '3.13'
	protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0.dev0,>=3.19.5
	requests<3.0.0.dev0,>=2.18.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}] <dev-python/google-auth-3.0_pre0[${PYTHON_USEDEP}]
	async-rest? ( >=dev-python/google-auth-2.35.0[aiohttp,${PYTHON_USEDEP}] <dev-python/google-auth-3.0_pre0[aiohttp,${PYTHON_USEDEP}] )
	>=dev-python/googleapis-common-protos-1.56.2[${PYTHON_USEDEP}] <dev-python/googleapis-common-protos-2.0_pre0[${PYTHON_USEDEP}]
	grpc? ( >=dev-python/grpcio-1.33.2[${PYTHON_USEDEP}] <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/grpcio-1.49.1[${PYTHON_USEDEP}] <dev-python/grpcio-2.0_pre[${PYTHON_USEDEP}] )
	grpcgcp? ( >=dev-python/grpcio-gcp-0.2.2[${PYTHON_USEDEP}] <dev-python/grpcio-gcp-1.0_pre0[${PYTHON_USEDEP}] )
	grpcio-gcp? ( >=dev-python/grpcio-gcp-0.2.2[${PYTHON_USEDEP}] <dev-python/grpcio-gcp-1.0_pre0[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/grpcio-status-1.33.2[${PYTHON_USEDEP}] <dev-python/grpcio-status-2.0_pre0[${PYTHON_USEDEP}] )
	grpc? ( >=dev-python/grpcio-status-1.49.1[${PYTHON_USEDEP}] <dev-python/grpcio-status-2.0_pre0[${PYTHON_USEDEP}] )
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}] <dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}] <dev-python/proto-plus-2.0.0_pre[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/protobuf-3.19.5[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0_pre0[${PYTHON_USEDEP}] !~dev-python/protobuf-3.20.0[${PYTHON_USEDEP}] !~dev-python/protobuf-3.20.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.0[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0_pre0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
BDEPEND+="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/rsa[${PYTHON_USEDEP}]
	)
"

EPYTEST_IGNORE=(
	# The grpc_gcp module is missing to perform a stress test
	tests/unit/test_grpc_helpers.py
)

python_test() {
	rm -rf google || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio tests
}
