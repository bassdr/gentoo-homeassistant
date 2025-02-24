# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/base58/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	PyHamcrest (>=2.0.2) ; extra == 'tests'
	mypy ; extra == 'tests'
	pytest (>=4.6) ; extra == 'tests'
	pytest-benchmark ; extra == 'tests'
	pytest-cov ; extra == 'tests'
	pytest-flake8 ; extra == 'tests'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pyhamcrest-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-4.6[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-flake8[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
