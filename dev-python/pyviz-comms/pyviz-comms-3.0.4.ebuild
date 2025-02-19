# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyviz-comms/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flake8; extra == 'all'
	flake8; extra == 'tests'
	jupyterlab~=4.0; extra == 'all'
	jupyterlab~=4.0; extra == 'build'
	keyring; extra == 'all'
	keyring; extra == 'build'
	param
	pytest; extra == 'all'
	pytest; extra == 'tests'
	rfc3986; extra == 'all'
	rfc3986; extra == 'build'
	setuptools>=40.8.0; extra == 'all'
	setuptools>=40.8.0; extra == 'build'
	twine; extra == 'all'
	twine; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/flake8[${PYTHON_USEDEP}] )
	all? ( >=dev-python/jupyterlab-4.0[${PYTHON_USEDEP}] =dev-python/jupyterlab-4*[${PYTHON_USEDEP}] )
	all? ( dev-python/keyring[${PYTHON_USEDEP}] )
	dev-python/param[${PYTHON_USEDEP}]
	all? ( dev-python/pytest[${PYTHON_USEDEP}] )
	all? ( dev-python/rfc3986[${PYTHON_USEDEP}] )
	all? ( >=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}] )
	all? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	>=dev-python/jupyterlab-4.0[${PYTHON_USEDEP}] =dev-python/jupyterlab-4*[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/rfc3986[${PYTHON_USEDEP}]
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
