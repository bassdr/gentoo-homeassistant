# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tox-gh-actions/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black ; (platform_python_implementation == 'CPython') and extra == 'testing'
	devpi-process ; extra == 'testing'
	flake8 <7,>=6 ; (python_version >= '3.8') and extra == 'testing'
	mypy ; (platform_python_implementation == 'CPython') and extra == 'testing'
	pytest <8,>=7 ; extra == 'testing'
	pytest-cov <4,>=3 ; extra == 'testing'
	pytest-mock <4,>=3 ; extra == 'testing'
	pytest-randomly >=3 ; extra == 'testing'
	tox <5,>=4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/tox-4[${PYTHON_USEDEP}] <dev-python/tox-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/devpi-process[${PYTHON_USEDEP}]
		>=dev-python/flake8-6[${PYTHON_USEDEP}] <dev-python/flake8-7[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}] <dev-python/pytest-8[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3[${PYTHON_USEDEP}] <dev-python/pytest-cov-4[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3[${PYTHON_USEDEP}] <dev-python/pytest-mock-4[${PYTHON_USEDEP}]
		>=dev-python/pytest-randomly-3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
