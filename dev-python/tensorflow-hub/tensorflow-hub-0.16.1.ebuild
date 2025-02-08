# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow-hub/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy >=1.12.0
	protobuf >=3.19.6
	tf-keras >=2.14.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.6[${PYTHON_USEDEP}]
	>=dev-python/tf-keras-2.14.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
