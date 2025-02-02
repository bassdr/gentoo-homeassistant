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

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
	docs? ( >=dev-python/pip-tools-6.13.0[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-metadata-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
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
)"
