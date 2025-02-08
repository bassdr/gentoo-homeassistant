# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark geopandas"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyogrio/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	certifi
	cython; extra == "dev"
	geopandas; extra == "geopandas"
	numpy
	packaging
	pytest-benchmark; extra == "benchmark"
	pytest-cov; extra == "test"
	pytest; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	geopandas? ( dev-python/geopandas[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	benchmark? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/cython[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
