# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-html/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	assertpy>=1.1; extra == 'test'
	beautifulsoup4>=4.11.1; extra == 'test'
	black>=22.1.0; extra == 'test'
	flake8>=4.0.1; extra == 'test'
	jinja2>=3.0.0
	pip-tools>=6.13.0; extra == 'docs'
	pre-commit>=2.17.0; extra == 'test'
	pytest-metadata>=2.0.0
	pytest-mock>=3.7.0; extra == 'test'
	pytest-rerunfailures>=11.1.2; extra == 'test'
	pytest-xdist>=2.4.0; extra == 'test'
	pytest>=7.0.0
	selenium>=4.3.0; extra == 'test'
	tox>=3.24.5; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/pip-tools-6.13.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-metadata-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/assertpy-1.1[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}]
		>=dev-python/black-22.1.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-rerunfailures-11.1.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}]
		>=dev-python/selenium-4.3.0[${PYTHON_USEDEP}]
		>=dev-python/tox-3.24.5[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.17.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
