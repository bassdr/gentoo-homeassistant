# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/texext/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/docutils-0.14[${PYTHON_USEDEP}]
	>=dev-python/sphinx-4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/matplotlib-3.1[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	>=dev-python/sphinxtesters-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/sympy-1.0[${PYTHON_USEDEP}]
)"
