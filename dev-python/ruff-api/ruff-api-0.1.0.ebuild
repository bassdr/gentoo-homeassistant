# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ruff-api/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/attribution-1.8.0[${PYTHON_USEDEP}]
	~dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
	~dev-python/maturin-1.7.4[${PYTHON_USEDEP}]
	~dev-python/mypy-1.13.0[${PYTHON_USEDEP}]
	~dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
	~dev-python/ufmt-2.7.3[${PYTHON_USEDEP}]
	~dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
)"
