# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/py-grpc-prometheus/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/grpcio-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-39.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
