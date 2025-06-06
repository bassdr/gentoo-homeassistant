# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tf2onnx/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flatbuffers (>=1.12)
	numpy (>=1.14.1)
	onnx (>=1.4.1)
	protobuf (~=3.20)
	requests
	six
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/flatbuffers-1.12[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.1[${PYTHON_USEDEP}]
	>=dev-python/onnx-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20[${PYTHON_USEDEP}] =dev-python/protobuf-3*[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
