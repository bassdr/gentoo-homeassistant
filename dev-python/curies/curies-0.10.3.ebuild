# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs fastapi flask pandas rdflib tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/curies/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	tests? ( dev-python/coverage[toml,${PYTHON_USEDEP}] )
	fastapi? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	flask? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	fastapi? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	flask? ( dev-python/flask[${PYTHON_USEDEP}] )
	fastapi? ( dev-python/httpx[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	fastapi? ( dev-python/python-multipart[${PYTHON_USEDEP}] )
	dev-python/pytrie[${PYTHON_USEDEP}]
	rdflib? ( dev-python/rdflib[${PYTHON_USEDEP}] )
	tests? ( dev-python/requests[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-8[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-automodapi[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-3.0[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	fastapi? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest