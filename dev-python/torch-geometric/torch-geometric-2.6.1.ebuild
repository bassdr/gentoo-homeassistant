# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="benchmark full graphgym modelhub"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/torch-geometric/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/aiohttp[${PYTHON_USEDEP}]
	full? ( dev-python/ase[${PYTHON_USEDEP}] )
	full? ( <dev-python/captum-0.7.0[${PYTHON_USEDEP}] )
	dev-python/fsspec[${PYTHON_USEDEP}]
	full? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	full? ( dev-python/h5py[${PYTHON_USEDEP}] )
	modelhub? ( dev-python/huggingface-hub[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	benchmark? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	full? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/networkx[${PYTHON_USEDEP}] )
	full? ( dev-python/networkx[${PYTHON_USEDEP}] )
	full? ( <dev-python/numba-0.60.0[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	full? ( dev-python/opt-einsum[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full? ( dev-python/pgmpy[${PYTHON_USEDEP}] )
	benchmark? ( <dev-python/protobuf-4.21[${PYTHON_USEDEP}] )
	graphgym? ( <dev-python/protobuf-4.21[${PYTHON_USEDEP}] )
	>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
	full? ( dev-python/pynndescent[${PYTHON_USEDEP}] )
	dev-python/pyparsing[${PYTHON_USEDEP}]
	graphgym? ( <dev-python/pytorch-lightning-2.3.0[${PYTHON_USEDEP}] )
	full? ( dev-python/pytorch-memlab[${PYTHON_USEDEP}] )
	full? ( dev-python/rdflib[${PYTHON_USEDEP}] )
	full? ( dev-python/rdkit[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	full? ( dev-python/scikit-image[${PYTHON_USEDEP}] )
	full? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	full? ( dev-python/scipy[${PYTHON_USEDEP}] )
	full? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	full? ( dev-python/sympy[${PYTHON_USEDEP}] )
	full? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	full? ( dev-python/torch-geometric[graphgym,modelhub,${PYTHON_USEDEP}] )
	full? ( dev-python/torchmetrics[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	full? ( dev-python/trimesh[${PYTHON_USEDEP}] )
	benchmark? ( dev-python/wandb[${PYTHON_USEDEP}] )
	graphgym? ( dev-python/yacs[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/matplotlib-inline[${PYTHON_USEDEP}]
	dev-python/onnx[${PYTHON_USEDEP}]
	dev-python/onnxruntime[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/torch-geometric[test,${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
