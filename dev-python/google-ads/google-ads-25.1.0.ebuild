# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/google-ads/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<=dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}]
	<dev-python/google-auth-oauthlib-2.0.0[${PYTHON_USEDEP}]
	<dev-python/googleapis-common-protos-2.0.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-status-2.0.0[${PYTHON_USEDEP}]
	tests? ( <dev-python/nox-2022.6[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	<dev-python/protobuf-6.0.0[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
