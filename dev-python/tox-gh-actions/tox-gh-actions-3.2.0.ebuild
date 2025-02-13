# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tox-gh-actions/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/black[${PYTHON_USEDEP}]
	<dev-python/flake8-7[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	<dev-python/tox-5[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/devpi-process[${PYTHON_USEDEP}]
	<dev-python/pytest-8[${PYTHON_USEDEP}]
	<dev-python/pytest-cov-4[${PYTHON_USEDEP}]
	<dev-python/pytest-mock-4[${PYTHON_USEDEP}]
	>=dev-python/pytest-randomly-3[${PYTHON_USEDEP}]
)"
