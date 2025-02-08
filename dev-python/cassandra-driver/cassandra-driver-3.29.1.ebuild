# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cle graph"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cassandra-driver/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cryptography>=35.0; extra == "cle"
	geomet<0.3,>=0.1
	gremlinpython==3.4.6; extra == "graph"
"
GENERATED_RDEPEND="${RDEPEND}
	cle? ( >=dev-python/cryptography-35.0[${PYTHON_USEDEP}] )
	>=dev-python/geomet-0.1[${PYTHON_USEDEP}] <dev-python/geomet-0.3[${PYTHON_USEDEP}]
	graph? ( ~dev-python/gremlinpython-3.4.6[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
