# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastai/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	accelerate>=0.21; extra == "dev"
	albumentations; extra == "dev"
	captum>=0.4.1; extra == "dev"
	catalyst; extra == "dev"
	comet-ml; extra == "dev"
	fastcore<1.8,>=1.5.29
	fastdownload<2,>=0.0.5
	fastprogress>=0.2.4
	flask-compress; extra == "dev"
	flask; extra == "dev"
	ipykernel; extra == "dev"
	ipywidgets; extra == "dev"
	kornia; extra == "dev"
	lightning; extra == "dev"
	matplotlib
	ninja; extra == "dev"
	opencv-python; extra == "dev"
	packaging
	pandas
	pillow>=9.0.0
	pip
	pyarrow; extra == "dev"
	pydicom; extra == "dev"
	pytorch-ignite; extra == "dev"
	pyyaml
	requests
	scikit-image; extra == "dev"
	scikit-learn
	scipy
	sentencepiece; extra == "dev"
	spacy<4
	tensorboard; extra == "dev"
	timm>=0.9; extra == "dev"
	torch<2.6,>=1.10
	torchvision>=0.11
	transformers; extra == "dev"
	wandb; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fastcore-1.5.29[${PYTHON_USEDEP}] <dev-python/fastcore-1.8[${PYTHON_USEDEP}]
	>=dev-python/fastdownload-0.0.5[${PYTHON_USEDEP}] <dev-python/fastdownload-2[${PYTHON_USEDEP}]
	>=dev-python/fastprogress-0.2.4[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.0.0[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	<dev-python/spacy-4[${PYTHON_USEDEP}]
	>=dev-python/torch-1.10[${PYTHON_USEDEP}] <dev-python/torch-2.6[${PYTHON_USEDEP}]
	>=dev-python/torchvision-0.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/accelerate-0.21[${PYTHON_USEDEP}]
		dev-python/albumentations[${PYTHON_USEDEP}]
		>=dev-python/captum-0.4.1[${PYTHON_USEDEP}]
		dev-python/catalyst[${PYTHON_USEDEP}]
		dev-python/comet-ml[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/flask-compress[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/ipywidgets[${PYTHON_USEDEP}]
		dev-python/kornia[${PYTHON_USEDEP}]
		dev-python/lightning[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/opencv-python[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pydicom[${PYTHON_USEDEP}]
		dev-python/pytorch-ignite[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
		dev-python/sentencepiece[${PYTHON_USEDEP}]
		dev-python/tensorboard[${PYTHON_USEDEP}]
		>=dev-python/timm-0.9[${PYTHON_USEDEP}]
		dev-python/transformers[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
