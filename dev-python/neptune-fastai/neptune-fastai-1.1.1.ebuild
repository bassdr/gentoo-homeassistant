# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-fastai/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fastai (>=2.4)
	importlib-metadata ; python_version < '3.8'
	neptune (>=1.0.0) ; extra == 'dev'
	pre-commit ; extra == 'dev'
	pytest (>=5.0) ; extra == 'dev'
	pytest-cov (==2.10.1) ; extra == 'dev'
	pytest-tap (==3.2) ; extra == 'dev'
	pytest-xdist (==2.2.0) ; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fastai-2.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/neptune-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		~dev-python/pytest-tap-3.2[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-2.2.0[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
