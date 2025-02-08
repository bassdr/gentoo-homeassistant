# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/netcal/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	gpytorch>=1.5.1
	matplotlib<3.8,>=3.3
	numpy>=1.18
	pyro-ppl>=1.8
	scikit-learn>=0.24
	scipy>=1.4
	tensorboard>=2.2
	tikzplotlib==0.9.8
	torch>=1.9
	torchvision>=0.10.0
	tqdm>=4.40
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/gpytorch-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.3[${PYTHON_USEDEP}] <dev-python/matplotlib-3.8[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18[${PYTHON_USEDEP}]
	>=dev-python/pyro-ppl-1.8[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-0.24[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.4[${PYTHON_USEDEP}]
	>=dev-python/tensorboard-2.2[${PYTHON_USEDEP}]
	~dev-python/tikzplotlib-0.9.8[${PYTHON_USEDEP}]
	>=dev-python/torch-1.9[${PYTHON_USEDEP}]
	>=dev-python/torchvision-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.40[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
