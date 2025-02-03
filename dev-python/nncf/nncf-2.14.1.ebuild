# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="plots"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nncf/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jsonschema-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/jstyleson-0.0.2[${PYTHON_USEDEP}]
	plots? ( >=dev-python/kaleido-0.2.1[${PYTHON_USEDEP}] )
	plots? ( <dev-python/matplotlib-3.6[${PYTHON_USEDEP}] )
	>=dev-python/natsort-7.1.0[${PYTHON_USEDEP}]
	<=dev-python/networkx-3.3[${PYTHON_USEDEP}]
	<dev-python/ninja-1.12[${PYTHON_USEDEP}]
	<dev-python/numpy-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/openvino-telemetry-2023.2.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	<dev-python/pandas-2.3[${PYTHON_USEDEP}]
	plots? ( >=dev-python/pillow-9.0.0[${PYTHON_USEDEP}] )
	plots? ( >=dev-python/plotly-express-0.4.1[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	<dev-python/pydot-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pymoo-0.6.0.1[${PYTHON_USEDEP}]
	>=dev-python/rich-13.5.2[${PYTHON_USEDEP}]
	>=dev-python/safetensors-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.54.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
