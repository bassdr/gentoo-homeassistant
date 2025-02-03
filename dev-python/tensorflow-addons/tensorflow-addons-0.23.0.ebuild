# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="tensorflow tensorflow-cpu tensorflow-gpu"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow-addons/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/packaging[${PYTHON_USEDEP}]
	tensorflow? ( <dev-python/tensorflow-2.16.0[${PYTHON_USEDEP}] )
	tensorflow-cpu? ( <dev-python/tensorflow-cpu-2.16.0[${PYTHON_USEDEP}] )
	tensorflow-gpu? ( <dev-python/tensorflow-gpu-2.16.0[${PYTHON_USEDEP}] )
	<dev-python/typeguard-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
