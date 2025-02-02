# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/yandexcloud/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	<dev-python/googleapis-common-protos-2[${PYTHON_USEDEP}]
	<dev-python/grpcio-2[${PYTHON_USEDEP}]
	>=dev-python/grpcio-tools-1.59.3[${PYTHON_USEDEP}]
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	<dev-python/pyjwt-3[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	<dev-python/six-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
