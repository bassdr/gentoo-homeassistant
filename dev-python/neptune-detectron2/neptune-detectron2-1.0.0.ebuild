# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-detectron2/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fvcore (<0.1.5.post20221220)
	importlib-metadata ; python_version < '3.8'
	neptune (>=1.0.0) ; extra == 'dev'
	numpy (<1.24.0)
	pre-commit ; extra == 'dev'
	pytest (>=5.0) ; extra == 'dev'
	pytest-cov (==2.10.1) ; extra == 'dev'
	torch (>=1.13.0,<2.0.0) ; extra == 'dev'
	torchvision (>=0.14.0,<0.15.0) ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	<dev-python/fvcore-0.1.5_p20221220[${PYTHON_USEDEP}]
	<dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/neptune-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		>=dev-python/torch-1.13.0[${PYTHON_USEDEP}] <dev-python/torch-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/torchvision-0.14.0[${PYTHON_USEDEP}] <dev-python/torchvision-0.15.0[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

