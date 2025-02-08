# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="mysql postgresql"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/python3-openid/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	defusedxml
	mysql-connector-python ; extra == 'mysql'
	psycopg2 ; extra == 'postgresql'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/defusedxml[${PYTHON_USEDEP}]
	mysql? ( dev-python/mysql-connector-python[${PYTHON_USEDEP}] )
	postgresql? ( dev-python/psycopg2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
