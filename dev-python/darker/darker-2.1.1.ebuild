# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="color flynt isort release"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/darker/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Pygments>=2.4.0; extra == 'color'
	airium>=0.2.3; extra == 'test'
	black>=22.3.0
	black>=22.3.0; extra == 'test'
	cryptography>=3.3.2; extra == 'test'
	darkgray-dev-tools~=0.0.2; extra == 'release'
	darkgraylib~=1.2.0
	defusedxml>=0.7.1; extra == 'test'
	flynt>=0.76; extra == 'flynt'
	flynt>=0.76; extra == 'test'
	graylint~=1.1.1
	isort>=5.0.1; extra == 'isort'
	isort>=5.0.1; extra == 'test'
	mypy>=0.990; extra == 'test'
	pathspec; extra == 'test'
	pip-requirements-parser; extra == 'test'
	pydocstyle; extra == 'test'
	pygments; extra == 'test'
	pylint; extra == 'test'
	pytest-kwparametrize>=0.0.3; extra == 'test'
	pytest>=6.2.0; extra == 'test'
	regex>=2021.4.4; extra == 'test'
	requests-cache>=0.7; extra == 'test'
	ruamel.yaml>=0.17.21; extra == 'test'
	ruff>=0.0.292; extra == 'test'
	toml>=0.10.0
	twine>=2.0.0; extra == 'test'
	types-requests>=2.27.9; extra == 'test'
	types-toml>=0.10.4; extra == 'test'
	urllib3>=1.25.9; extra == 'test'
	wheel>=0.21.0; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/black-22.3.0[${PYTHON_USEDEP}]
	release? ( >=dev-python/darkgray-dev-tools-0.0.2[${PYTHON_USEDEP}] =dev-python/darkgray-dev-tools-0.0*[${PYTHON_USEDEP}] )
	>=dev-python/darkgraylib-1.2.0[${PYTHON_USEDEP}] =dev-python/darkgraylib-1.2*[${PYTHON_USEDEP}]
	flynt? ( >=dev-python/flynt-0.76[${PYTHON_USEDEP}] )
	>=dev-python/graylint-1.1.1[${PYTHON_USEDEP}] =dev-python/graylint-1.1*[${PYTHON_USEDEP}]
	isort? ( >=dev-python/isort-5.0.1[${PYTHON_USEDEP}] )
	color? ( >=dev-python/pygments-2.4.0[${PYTHON_USEDEP}] )
	>=dev-python/toml-0.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/airium-0.2.3[${PYTHON_USEDEP}]
		>=dev-python/black-22.3.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-3.3.2[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/flynt-0.76[${PYTHON_USEDEP}]
		>=dev-python/isort-5.0.1[${PYTHON_USEDEP}]
		>=dev-python/mypy-0.990[${PYTHON_USEDEP}]
		dev-python/pathspec[${PYTHON_USEDEP}]
		dev-python/pip-requirements-parser[${PYTHON_USEDEP}]
		dev-python/pydocstyle[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-kwparametrize-0.0.3[${PYTHON_USEDEP}]
		>=dev-python/regex-2021.4.4[${PYTHON_USEDEP}]
		>=dev-python/requests-cache-0.7[${PYTHON_USEDEP}]
		>=dev-python/ruamel-yaml-0.17.21[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.0.292[${PYTHON_USEDEP}]
		>=dev-python/twine-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/types-requests-2.27.9[${PYTHON_USEDEP}]
		>=dev-python/types-toml-0.10.4[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.25.9[${PYTHON_USEDEP}]
		>=dev-python/wheel-0.21.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
