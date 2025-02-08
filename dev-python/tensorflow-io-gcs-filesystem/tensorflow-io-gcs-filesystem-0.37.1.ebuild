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
  https://pypi.org/project/tensorflow-io-gcs-filesystem/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	tensorflow-aarch64<2.17.0,>=2.16.0; extra == "tensorflow-aarch64"
	tensorflow-cpu<2.17.0,>=2.16.0; extra == "tensorflow-cpu"
	tensorflow-gpu<2.17.0,>=2.16.0; extra == "tensorflow-gpu"
	tensorflow-rocm<2.17.0,>=2.16.0; extra == "tensorflow-rocm"
	tensorflow<2.17.0,>=2.16.0; extra == "tensorflow"
"
GENERATED_RDEPEND="${RDEPEND}
	tensorflow? ( >=dev-python/tensorflow-2.16.0[${PYTHON_USEDEP}] <dev-python/tensorflow-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-aarch64? ( >=dev-python/tensorflow-aarch64-2.16.0[${PYTHON_USEDEP}] <dev-python/tensorflow-aarch64-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-cpu? ( >=dev-python/tensorflow-cpu-2.16.0[${PYTHON_USEDEP}] <dev-python/tensorflow-cpu-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-gpu? ( >=dev-python/tensorflow-gpu-2.16.0[${PYTHON_USEDEP}] <dev-python/tensorflow-gpu-2.17.0[${PYTHON_USEDEP}] )
	tensorflow-rocm? ( >=dev-python/tensorflow-rocm-2.16.0[${PYTHON_USEDEP}] <dev-python/tensorflow-rocm-2.17.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
