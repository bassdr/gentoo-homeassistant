# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="aws docs pandas rdf tests xml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pystow/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	aws? ( dev-python/boto3[${PYTHON_USEDEP}] )
	dev-python/click[${PYTHON_USEDEP}]
	tests? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	xml? ( dev-python/lxml[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	rdf? ( dev-python/rdflib[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	tests? ( dev-python/requests-file[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-automodapi[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-3.0[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest