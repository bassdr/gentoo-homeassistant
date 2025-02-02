# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="hub pytorch text"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/albumentations/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/albucore-0.0.23[${PYTHON_USEDEP}]
	hub? ( dev-python/huggingface-hub[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.24.4[${PYTHON_USEDEP}]
	>=dev-python/opencv-python-headless-4.9.0.80[${PYTHON_USEDEP}]
	text? ( dev-python/pillow[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.9.2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
	pytorch? ( dev-python/torch[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
