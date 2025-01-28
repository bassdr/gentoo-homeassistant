# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev ini sphinx yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/everett/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/build[${PYTHON_USEDEP}] )
	dev? ( dev-python/cogapp[${PYTHON_USEDEP}] )
	ini? ( dev-python/configobj[${PYTHON_USEDEP}] )
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	yaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	dev? ( dev-python/ruff[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	sphinx? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox-gh-actions[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox-uv[${PYTHON_USEDEP}] )
	dev? ( dev-python/twine[${PYTHON_USEDEP}] )
	dev? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest