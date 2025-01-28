# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tbparse/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	testing? ( dev-python/flake8[${PYTHON_USEDEP}] )
	testing? ( dev-python/mypy[${PYTHON_USEDEP}] )
	testing? ( dev-python/nbsphinx[${PYTHON_USEDEP}] )
	>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	testing? ( dev-python/pylint[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/seaborn[${PYTHON_USEDEP}] )
	testing? ( dev-python/soundfile[${PYTHON_USEDEP}] )
	testing? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	testing? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	testing? ( dev-python/sphinx-tabs[${PYTHON_USEDEP}] )
	>=dev-python/tensorboard-2.12.0[${PYTHON_USEDEP}]
	testing? ( ~dev-python/tensorboardx-2.6[${PYTHON_USEDEP}] )
	testing? ( dev-python/torch[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest