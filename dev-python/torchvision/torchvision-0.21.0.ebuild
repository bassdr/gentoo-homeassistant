# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="gdown scipy"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/torchvision/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	gdown>=4.7.3; extra == 'gdown'
	numpy
	pillow!=8.3.*,>=5.3.0
	scipy; extra == 'scipy'
	torch==2.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	gdown? ( >=dev-python/gdown-4.7.3[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/pillow-5.3.0[${PYTHON_USEDEP}] !=dev-python/pillow-8.3*[${PYTHON_USEDEP}]
	scipy? ( dev-python/scipy[${PYTHON_USEDEP}] )
	~dev-python/torch-2.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
