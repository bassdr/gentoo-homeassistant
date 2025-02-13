# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all check contents lab libarchive serve test translation"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyterlite-core/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	test? ( dev-python/ansi2html[${PYTHON_USEDEP}] )
	dev-python/diffoscope[${PYTHON_USEDEP}]
	<dev-python/doit-1[${PYTHON_USEDEP}]
	all? ( >=dev-python/jsonschema-3[${PYTHON_USEDEP}] )
	check? ( >=dev-python/jsonschema-3[format-nongpl,${PYTHON_USEDEP}] )
	>=dev-python/jupyter-core-4.7[${PYTHON_USEDEP}]
	all? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	contents? ( dev-python/jupyter-server[${PYTHON_USEDEP}] )
	all? ( <dev-python/jupyterlab-4.4[${PYTHON_USEDEP}] )
	lab? ( <dev-python/jupyterlab-4.4[${PYTHON_USEDEP}] )
	all? ( <dev-python/jupyterlab-server-3[${PYTHON_USEDEP}] )
	translation? ( <dev-python/jupyterlab-server-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/libarchive-c-4.0[${PYTHON_USEDEP}] )
	libarchive? ( >=dev-python/libarchive-c-4.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/notebook-7.4[${PYTHON_USEDEP}] )
	lab? ( <dev-python/notebook-7.4[${PYTHON_USEDEP}] )
	all? ( dev-python/pkginfo[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-console-scripts[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-html[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	all? ( >=dev-python/tornado-6.1[${PYTHON_USEDEP}] )
	serve? ( >=dev-python/tornado-6.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest