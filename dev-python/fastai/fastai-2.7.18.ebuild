# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastai/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( >=dev-python/accelerate-0.21[${PYTHON_USEDEP}] )
	dev? ( dev-python/albumentations[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/captum-0.4.1[${PYTHON_USEDEP}] )
	dev? ( dev-python/catalyst[${PYTHON_USEDEP}] )
	dev? ( dev-python/comet-ml[${PYTHON_USEDEP}] )
	<dev-python/fastcore-1.8[${PYTHON_USEDEP}]
	<dev-python/fastdownload-2[${PYTHON_USEDEP}]
	>=dev-python/fastprogress-0.2.4[${PYTHON_USEDEP}]
	dev? ( dev-python/flask[${PYTHON_USEDEP}] )
	dev? ( dev-python/flask-compress[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	dev? ( dev-python/kornia[${PYTHON_USEDEP}] )
	dev? ( dev-python/lightning[${PYTHON_USEDEP}] )
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev? ( dev-python/ninja[${PYTHON_USEDEP}] )
	dev? ( dev-python/opencv-python[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.0.0[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	dev? ( dev-python/pydicom[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytorch-ignite[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev? ( dev-python/scikit-image[${PYTHON_USEDEP}] )
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev? ( dev-python/sentencepiece[${PYTHON_USEDEP}] )
	<dev-python/spacy-4[${PYTHON_USEDEP}]
	dev? ( dev-python/tensorboard[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/timm-0.9[${PYTHON_USEDEP}] )
	<dev-python/torch-2.6[${PYTHON_USEDEP}]
	>=dev-python/torchvision-0.11[${PYTHON_USEDEP}]
	dev? ( dev-python/transformers[${PYTHON_USEDEP}] )
	dev? ( dev-python/wandb[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest