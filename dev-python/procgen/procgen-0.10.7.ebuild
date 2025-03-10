# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/procgen/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	filelock (<4.0.0,>=3.0.0)
	gym (<1.0.0,>=0.15.0)
	gym3 (<1.0.0,>=0.3.3)
	numpy (<2.0.0,>=1.17.0)
	pytest (==6.2.5) ; extra == 'test'
	pytest-benchmark (==3.4.1) ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/filelock-3.0.0[${PYTHON_USEDEP}] <dev-python/filelock-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/gym-0.15.0[${PYTHON_USEDEP}] <dev-python/gym-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/gym3-0.3.3[${PYTHON_USEDEP}] <dev-python/gym3-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}] <dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		~dev-python/pytest-benchmark-3.4.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
