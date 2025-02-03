# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs ipython plot s3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rasterio/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	dev-python/affine[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	all? ( >=dev-python/boto3-1.2.4[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.2.4[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/click-4.0[${PYTHON_USEDEP}]
	dev-python/click-plugins[${PYTHON_USEDEP}]
	>=dev-python/cligj-0.5[${PYTHON_USEDEP}]
	all? ( dev-python/fsspec[${PYTHON_USEDEP}] )
	all? ( dev-python/ghp-import[${PYTHON_USEDEP}] )
	docs? ( dev-python/ghp-import[${PYTHON_USEDEP}] )
	all? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	all? ( >=dev-python/ipython-2.0[${PYTHON_USEDEP}] )
	ipython? ( >=dev-python/ipython-2.0[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	plot? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	all? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	all? ( dev-python/packaging[${PYTHON_USEDEP}] )
	dev-python/pyparsing[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytest-2.8.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-cov-2.2.0[${PYTHON_USEDEP}] )
	all? ( dev-python/shapely[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-click[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/boto3-1.2.4[${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.8.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.2.0[${PYTHON_USEDEP}]
		dev-python/shapely[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
