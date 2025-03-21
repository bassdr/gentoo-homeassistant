# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Standard Protobuf Reflection Service for gRPC"
HOMEPAGE="
  https://pypi.org/project/grpcio-reflection/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	grpcio>=1.67.1
	protobuf<6.0dev,>=5.26.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.26.1[${PYTHON_USEDEP}] <dev-python/protobuf-6.0_pre[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/grpcio-${PV}[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.26.1[${PYTHON_USEDEP}]"
BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
