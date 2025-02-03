# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.apt"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco.apt/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	docs? ( >=dev-python/jaraco-packaging-3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		!=dev-python/pytest-3.7.3[${PYTHON_USEDEP}]
		dev-python/pytest-checkdocs[${PYTHON_USEDEP}]
		dev-python/pytest-flake8[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
