# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="reference"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/onnx/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pillow; extra == 'reference'
	google-re2; extra == 'reference'
	numpy>=1.20
	protobuf>=3.20.2
"
GENERATED_RDEPEND="${RDEPEND}
	reference? ( dev-python/google-re2[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20[${PYTHON_USEDEP}]
	reference? ( dev-python/pillow[${PYTHON_USEDEP}] )
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
