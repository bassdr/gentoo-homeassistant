# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

PYPI_PN="jaraco.packaging"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco.packaging/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/build[virtualenv,${PYTHON_USEDEP}]
	dev-python/domdf-python-tools[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-context[${PYTHON_USEDEP}]
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	dev-python/sphinx[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
	dev-python/pytest-mypy[${PYTHON_USEDEP}]
	dev-python/types-docutils[${PYTHON_USEDEP}]
)"
