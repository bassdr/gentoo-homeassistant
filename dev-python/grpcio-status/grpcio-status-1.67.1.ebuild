# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1

MY_P=grpc-${PV}
DESCRIPTION="Status proto mapping for gRPC"
HOMEPAGE="
  https://pypi.org/project/grpcio-status/
"
SRC_URI="
	https://github.com/grpc/grpc/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}/src/python/grpcio_status

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/googleapis-common-protos[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/grpcio-${PV}[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.5.5[${PYTHON_USEDEP}]
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.26.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

	cd "${WORKDIR}/${MY_P}/src/python/grpcio_tests" || die
	epytest tests{,_aio}/status
}