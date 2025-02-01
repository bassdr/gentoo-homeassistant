# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="tensorflow tensorflow-aarch64 tensorflow-cpu tensorflow-gpu tensorflow-rocm"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow-io/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	tensorflow? ( <dev-python/tensorflow-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-aarch64? ( <dev-python/tensorflow-aarch64-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-cpu? ( <dev-python/tensorflow-cpu-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-gpu? ( <dev-python/tensorflow-gpu-2.17.0[${PYTHON_USEDEP}] )
	~dev-python/tensorflow-io-gcs-filesystem-0.37.1[${PYTHON_USEDEP}]
	tensorflow-rocm? ( <dev-python/tensorflow-rocm-2.17.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
