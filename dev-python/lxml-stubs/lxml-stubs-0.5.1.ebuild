# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/lxml-stubs/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	coverage[toml] >=7.2.5 ; extra == 'test'
	mypy >=1.2.0 ; extra == 'test'
	pytest >=7.3.0 ; extra == 'test'
	pytest-mypy-plugins >=1.10.1 ; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-7.2.5[toml,${PYTHON_USEDEP}]
		>=dev-python/mypy-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-plugins-1.10.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
