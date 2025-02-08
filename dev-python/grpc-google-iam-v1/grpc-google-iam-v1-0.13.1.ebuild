# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="IAM API client library"
HOMEPAGE="
  https://pypi.org/project/grpc-google-iam-v1/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	googleapis-common-protos[grpc]<2.0.0dev,>=1.56.0
	grpcio<2.0.0dev,>=1.44.0
	protobuf!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0dev,>=3.20.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/googleapis-common-protos-1.56.0[grpc,${PYTHON_USEDEP}] <dev-python/googleapis-common-protos-2.0.0_pre[grpc,${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.44.0[${PYTHON_USEDEP}] <dev-python/grpcio-2.0.0_pre[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}] <dev-python/protobuf-6.0.0_pre[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.1[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.2[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.3[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.4[${PYTHON_USEDEP}] !~dev-python/protobuf-4.21.5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
