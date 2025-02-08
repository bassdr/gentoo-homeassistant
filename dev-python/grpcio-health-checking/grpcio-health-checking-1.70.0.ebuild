# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/grpcio-health-checking/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	grpcio>=1.70.0
	protobuf<6.0dev,>=5.26.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/grpcio-1.70.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.26.1[${PYTHON_USEDEP}] <dev-python/protobuf-6.0_pre[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
