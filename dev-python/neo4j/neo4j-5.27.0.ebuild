# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="numpy pandas pyarrow"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neo4j/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	numpy? ( <dev-python/numpy-3.0.0[${PYTHON_USEDEP}] )
	pandas? ( <dev-python/numpy-3.0.0[${PYTHON_USEDEP}] )
	pandas? ( <dev-python/pandas-3.0.0[${PYTHON_USEDEP}] )
	pyarrow? ( >=dev-python/pyarrow-1.0.0[${PYTHON_USEDEP}] )
	dev-python/pytz[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
