# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="documentation testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-kwparametrize/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	testing? ( dev-python/black[${PYTHON_USEDEP}] )
	testing? ( dev-python/flake8[${PYTHON_USEDEP}] )
	testing? ( dev-python/isort[${PYTHON_USEDEP}] )
	documentation? ( dev-python/pallets-sphinx-themes[${PYTHON_USEDEP}] )
	documentation? ( dev-python/pygments-pytest[${PYTHON_USEDEP}] )
	testing? ( dev-python/pylint[${PYTHON_USEDEP}] )
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	documentation? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest