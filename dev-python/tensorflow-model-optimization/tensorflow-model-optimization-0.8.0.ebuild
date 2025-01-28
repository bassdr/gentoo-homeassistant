# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tensorflow-model-optimization/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	~dev-python/absl-py-1.2[${PYTHON_USEDEP}]
	~dev-python/dm-tree-0.1.1[${PYTHON_USEDEP}]
	~dev-python/enum34-1.1[${PYTHON_USEDEP}]
	~dev-python/numpy-1.23[${PYTHON_USEDEP}]
	~dev-python/six-1.14[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest