# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tfx-bsl/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/absl-py-2.0.0[${PYTHON_USEDEP}]
	<dev-python/apache-beam-3[gcp,${PYTHON_USEDEP}]
	<dev-python/google-api-python-client-2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
	<dev-python/pandas-2[${PYTHON_USEDEP}]
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	<dev-python/pyarrow-11[${PYTHON_USEDEP}]
	<dev-python/tensorflow-2.17[${PYTHON_USEDEP}]
	<dev-python/tensorflow-metadata-1.17.0[${PYTHON_USEDEP}]
	<dev-python/tensorflow-serving-api-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
"
BDEPEND="${GENERATED_BDEPEND}"
