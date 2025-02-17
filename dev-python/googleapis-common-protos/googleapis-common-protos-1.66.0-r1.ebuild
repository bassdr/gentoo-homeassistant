# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="Common protobufs used in Google APIs"
HOMEPAGE="
  https://pypi.org/project/googleapis-common-protos/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="grpc"
IUSE="${GENERATED_IUSE} +grpc"
REQUIRES_DIST="
	grpcio<2.0.0.dev0,>=1.44.0; extra == 'grpc'
	protobuf!=3.20.0,!=3.20.1,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0.dev0,>=3.20.2
"
GENERATED_RDEPEND="${RDEPEND}
	grpc? ( >=dev-python/grpcio-1.44.0[${PYTHON_USEDEP}] <dev-python/grpcio-2.0.0_pre0[${PYTHON_USEDEP}] )
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0_pre0[${PYTHON_USEDEP}] !~dev-python/protobuf-3.20.0[${PYTHON_USEDEP}] !~dev-python/protobuf-3.20.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}
