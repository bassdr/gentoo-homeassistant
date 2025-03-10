# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-airflow/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	importlib-metadata ; python_version < '3.8'
	neptune (>=1.6.3) ; extra == 'dev'
	pre-commit ; extra == 'dev'
	pytest (>=5.0) ; extra == 'dev'
	pytest-cov (==2.10.1) ; extra == 'dev'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/neptune-1.6.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
