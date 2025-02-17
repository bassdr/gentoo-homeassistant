# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="supported"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/matrepr/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	html5lib; extra == 'test'
	numpy; extra == 'supported'
	pytest; extra == 'test'
	python-graphblas; extra == 'supported'
	scipy; extra == 'supported'
	scipy; extra == 'test'
	sparse; extra == 'supported'
	tabulate
	tensorflow; extra == 'supported'
	torch>=2.0.0; extra == 'supported'
"
GENERATED_RDEPEND="${RDEPEND}
	supported? ( dev-python/numpy[${PYTHON_USEDEP}] )
	supported? ( dev-python/python-graphblas[${PYTHON_USEDEP}] )
	supported? ( dev-python/scipy[${PYTHON_USEDEP}] )
	supported? ( dev-python/sparse[${PYTHON_USEDEP}] )
	dev-python/tabulate[${PYTHON_USEDEP}]
	supported? ( dev-python/tensorflow[${PYTHON_USEDEP}] )
	supported? ( >=dev-python/torch-2.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/html5lib[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
