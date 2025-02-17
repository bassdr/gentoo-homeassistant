# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc ows plotting speedups srtm"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cartopy/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	OWSLib>=0.27.0; extra == 'ows'
	beautifulsoup4; extra == 'srtm'
	coveralls; extra == 'test'
	fiona; extra == 'speedups'
	matplotlib>=3.6
	numpy>=1.23
	packaging>=21
	pillow>=9.1; extra == 'ows'
	pillow>=9.1; extra == 'plotting'
	pydata-sphinx-theme; extra == 'doc'
	pykdtree; extra == 'speedups'
	pyproj>=3.3.1
	pyshp>=2.3
	pytest-cov; extra == 'test'
	pytest-mpl>=0.11; extra == 'test'
	pytest-xdist; extra == 'test'
	pytest>=5.1.2; extra == 'test'
	scipy>=1.9; extra == 'plotting'
	shapely>=1.8
	sphinx-gallery; extra == 'doc'
	sphinx; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	srtm? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	speedups? ( dev-python/fiona[${PYTHON_USEDEP}] )
	>=dev-python/matplotlib-3.6[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
	ows? ( >=dev-python/owslib-0.27.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-21[${PYTHON_USEDEP}]
	ows? ( >=dev-python/pillow-9.1[${PYTHON_USEDEP}] )
	plotting? ( >=dev-python/pillow-9.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	speedups? ( dev-python/pykdtree[${PYTHON_USEDEP}] )
	>=dev-python/pyproj-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/pyshp-2.3[${PYTHON_USEDEP}]
	plotting? ( >=dev-python/scipy-1.9[${PYTHON_USEDEP}] )
	>=dev-python/shapely-1.8[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coveralls[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.1.2[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-mpl-0.11[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
