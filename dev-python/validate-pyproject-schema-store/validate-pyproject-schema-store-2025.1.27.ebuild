# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all docs validate-pyproject"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/validate-pyproject-schema-store/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( >=dev-python/furo-2023.08.17[${PYTHON_USEDEP}] )
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	docs? ( >=dev-python/myst-parser-0.13[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	all? ( dev-python/validate-pyproject[all,${PYTHON_USEDEP}] )
	validate-pyproject? ( dev-python/validate-pyproject[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-3[${PYTHON_USEDEP}]
	>=dev-python/validate-pyproject-0.16[${PYTHON_USEDEP}]
)"
