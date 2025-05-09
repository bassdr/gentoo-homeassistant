# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="test tutorials"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/triton/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autopep8; extra == 'tests'
	cmake>=3.20; extra == 'build'
	flake8; extra == 'tests'
	isort; extra == 'tests'
	lit; extra == 'build'
	llnl-hatchet; extra == 'tests'
	matplotlib; extra == 'tutorials'
	numpy; extra == 'tests'
	pandas; extra == 'tutorials'
	pytest; extra == 'tests'
	scipy>=1.7.1; extra == 'tests'
	tabulate; extra == 'tutorials'
"
GENERATED_RDEPEND="${RDEPEND}
	tutorials? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	tutorials? ( dev-python/pandas[${PYTHON_USEDEP}] )
	tutorials? ( dev-python/tabulate[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	>=dev-build/cmake-3.20[${PYTHON_USEDEP}]
	dev-python/lit[${PYTHON_USEDEP}]
	test? (
		dev-python/autopep8[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/llnl-hatchet[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.7.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
