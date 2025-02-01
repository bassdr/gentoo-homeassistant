# Copyright 2020-2024 Gentoo Authors
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
IUSE="${GENERATED_IUSE} grpc"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/google-auth-3.0_p0[${PYTHON_USEDEP}]
	async-rest? ( <dev-python/google-auth-3.0_p0[aiohttp,${PYTHON_USEDEP}] )
	dev-python/google-auth[${PYTHON_USEDEP}]
	<dev-python/googleapis-common-protos-2.0_p0[${PYTHON_USEDEP}]
	dev-python/googleapis-common-protos[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0dev[${PYTHON_USEDEP}]
	grpc? ( <dev-python/grpcio-2.0dev[${PYTHON_USEDEP}] )
	grpcgcp? ( <dev-python/grpcio-gcp-1.0_p0[${PYTHON_USEDEP}] )
	grpcio-gcp? ( <dev-python/grpcio-gcp-1.0_p0[${PYTHON_USEDEP}] )
	<dev-python/grpcio-status-2.0_p0[${PYTHON_USEDEP}]
	grpc? ( <dev-python/grpcio-status-2.0_p0[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2.0.0dev[${PYTHON_USEDEP}]
	dev-python/proto-plus[${PYTHON_USEDEP}]
	!=dev-python/protobuf-3.20.0[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0_p0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/googleapis-common-protos-1.56.2[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	grpc? (
		>=dev-python/grpcio-1.49.1[${PYTHON_USEDEP}]
		>=dev-python/grpcio-status-1.49.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		>=dev-python/grpcio-1.49.1[${PYTHON_USEDEP}]
		>=dev-python/grpcio-status-1.49.1[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/rsa[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# The grpc_gcp module is missing to perform a stress test
	tests/unit/test_grpc_helpers.py
)

python_test() {
	rm -rf google || die

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p asyncio tests
}
