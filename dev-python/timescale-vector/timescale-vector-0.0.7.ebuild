# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/timescale-vector/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/asyncpg[${PYTHON_USEDEP}]
	dev? ( dev-python/langchain[${PYTHON_USEDEP}] )
	dev? ( dev-python/langchain-community[${PYTHON_USEDEP}] )
	dev? ( dev-python/langchain-openai[${PYTHON_USEDEP}] )
	dev-python/pgvector[${PYTHON_USEDEP}]
	dev-python/psycopg2[${PYTHON_USEDEP}]
	dev? ( dev-python/python-dotenv[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest