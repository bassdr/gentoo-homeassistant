# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/blosc2/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	h5py; extra == "dev"
	hdf5plugin; extra == "dev"
	httpx
	jupyterlab; extra == "dev"
	matplotlib; extra == "dev"
	msgpack
	myst-parser; extra == "doc"
	nbsphinx; extra == "doc"
	ndindex
	numexpr
	numpy>=1.25.0
	numpydoc; extra == "doc"
	pandas; extra == "dev"
	plotly; extra == "dev"
	pre-commit; extra == "dev"
	psutil; extra == "test"
	py-cpuinfo
	pyarrow; extra == "dev"
	pydata-sphinx-theme; extra == "doc"
	pytest; extra == "test"
	ruff; extra == "dev"
	s3fs; extra == "dev"
	sphinx-panels; extra == "doc"
	sphinx-paramlinks; extra == "doc"
	sphinx; extra == "doc"
	torch; extra == "test"
	xarray; extra == "dev"
	zarr; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	doc? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	doc? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	dev-python/ndindex[${PYTHON_USEDEP}]
	dev-python/numexpr[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	doc? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-panels[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-paramlinks[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/h5py[${PYTHON_USEDEP}]
		dev-python/hdf5plugin[${PYTHON_USEDEP}]
		dev-python/jupyterlab[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/plotly[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/s3fs[${PYTHON_USEDEP}]
		dev-python/torch[${PYTHON_USEDEP}]
		dev-python/xarray[${PYTHON_USEDEP}]
		dev-python/zarr[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
