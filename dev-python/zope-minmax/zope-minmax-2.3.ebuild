# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="zope.minmax"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/zope.minmax/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/persistent[${PYTHON_USEDEP}]
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/zope-testrunner[${PYTHON_USEDEP}]
)"
