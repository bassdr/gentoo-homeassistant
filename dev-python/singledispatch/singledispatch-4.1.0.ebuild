# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/singledispatch/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/jaraco-tidelift-1.4[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
	testing? ( dev-python/pytest-ruff[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest