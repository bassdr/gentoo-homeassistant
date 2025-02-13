# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all biocam ced dev docs edf igorproio iocache kwikio maxwell med neomatlabio nixio nwb test tiffio"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neo/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/black[${PYTHON_USEDEP}] )
	dev? ( dev-python/build[${PYTHON_USEDEP}] )
	all? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	test? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	med? ( <dev-python/dhn-med-py-2.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	all? ( dev-python/h5py[${PYTHON_USEDEP}] )
	biocam? ( dev-python/h5py[${PYTHON_USEDEP}] )
	maxwell? ( dev-python/h5py[${PYTHON_USEDEP}] )
	test? ( dev-python/h5py[${PYTHON_USEDEP}] )
	all? ( dev-python/igor2[${PYTHON_USEDEP}] )
	docs? ( dev-python/igor2[${PYTHON_USEDEP}] )
	igorproio? ( dev-python/igor2[${PYTHON_USEDEP}] )
	test? ( dev-python/igor2[${PYTHON_USEDEP}] )
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	test? ( dev-python/ipython[${PYTHON_USEDEP}] )
	all? ( >=dev-python/joblib-1.0.0[${PYTHON_USEDEP}] )
	iocache? ( >=dev-python/joblib-1.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/joblib-1.0.0[${PYTHON_USEDEP}] )
	all? ( dev-python/klusta[${PYTHON_USEDEP}] )
	kwikio? ( dev-python/klusta[${PYTHON_USEDEP}] )
	test? ( dev-python/klusta[${PYTHON_USEDEP}] )
	all? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	test? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	all? ( >=dev-python/nixio-1.5.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/nixio[${PYTHON_USEDEP}] )
	nixio? ( >=dev-python/nixio-1.5.0[${PYTHON_USEDEP}] )
	test? ( dev-python/nixio[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.22.4[${PYTHON_USEDEP}]
	docs? ( >=dev-python/numpy-2.0[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	all? ( dev-python/pillow[${PYTHON_USEDEP}] )
	test? ( dev-python/pillow[${PYTHON_USEDEP}] )
	tiffio? ( dev-python/pillow[${PYTHON_USEDEP}] )
	all? ( dev-python/probeinterface[${PYTHON_USEDEP}] )
	test? ( dev-python/probeinterface[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	all? ( dev-python/pyedflib[${PYTHON_USEDEP}] )
	edf? ( dev-python/pyedflib[${PYTHON_USEDEP}] )
	test? ( dev-python/pyedflib[${PYTHON_USEDEP}] )
	all? ( dev-python/pynwb[${PYTHON_USEDEP}] )
	docs? ( dev-python/pynwb[${PYTHON_USEDEP}] )
	nwb? ( dev-python/pynwb[${PYTHON_USEDEP}] )
	test? ( dev-python/pynwb[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	>=dev-python/quantities-0.16.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/scipy-1.0.0[${PYTHON_USEDEP}] )
	neomatlabio? ( >=dev-python/scipy-1.0.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/scipy-1.0.0[${PYTHON_USEDEP}] )
	all? ( dev-python/sonpy[${PYTHON_USEDEP}] )
	ced? ( dev-python/sonpy[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-inline-tabs[${PYTHON_USEDEP}] )
	all? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	test? ( dev-python/tqdm[${PYTHON_USEDEP}] )
	dev? ( dev-python/twine[${PYTHON_USEDEP}] )
	dev-python/wenv[${PYTHON_USEDEP}]
	dev-python/wenv[${PYTHON_USEDEP}]
	test? ( dev-python/wenv[${PYTHON_USEDEP}] )
	>=dev-python/zugbruecke-0.2[${PYTHON_USEDEP}]
	>=dev-python/zugbruecke-0.2[${PYTHON_USEDEP}]
	test? ( >=dev-python/zugbruecke-0.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest