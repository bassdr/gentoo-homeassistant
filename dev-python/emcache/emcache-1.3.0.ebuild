# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/emcache/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/black-24.4.2[${PYTHON_USEDEP}]
	~dev-python/coverage-7.5.3[${PYTHON_USEDEP}]
	~dev-python/cython-3.0.10[${PYTHON_USEDEP}]
	~dev-python/flake8-7.0.0[${PYTHON_USEDEP}]
	~dev-python/isort-5.13.2[${PYTHON_USEDEP}]
	~dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.11.0[${PYTHON_USEDEP}]
	~dev-python/pytest-mock-3.14.0[${PYTHON_USEDEP}]
)"
