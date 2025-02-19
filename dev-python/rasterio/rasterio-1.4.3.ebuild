# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs ipython plot s3 test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rasterio/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	affine
	attrs
	boto3>=1.2.4; extra == 'all'
	boto3>=1.2.4; extra == 's3'
	boto3>=1.2.4; extra == 'test'
	certifi
	click-plugins
	click>=4.0
	cligj>=0.5
	fsspec; extra == 'all'
	fsspec; extra == 'test'
	ghp-import; extra == 'all'
	ghp-import; extra == 'docs'
	hypothesis; extra == 'all'
	hypothesis; extra == 'test'
	importlib-metadata; python_version < '3.10'
	ipython>=2.0; extra == 'all'
	ipython>=2.0; extra == 'ipython'
	matplotlib; extra == 'all'
	matplotlib; extra == 'plot'
	numpy>=1.24
	numpydoc; extra == 'all'
	numpydoc; extra == 'docs'
	packaging; extra == 'all'
	packaging; extra == 'test'
	pyparsing
	pytest-cov>=2.2.0; extra == 'all'
	pytest-cov>=2.2.0; extra == 'test'
	pytest>=2.8.2; extra == 'all'
	pytest>=2.8.2; extra == 'test'
	shapely; extra == 'all'
	shapely; extra == 'test'
	sphinx-click; extra == 'all'
	sphinx-click; extra == 'docs'
	sphinx-rtd-theme; extra == 'all'
	sphinx-rtd-theme; extra == 'docs'
	sphinx; extra == 'all'
	sphinx; extra == 'docs'
"
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
