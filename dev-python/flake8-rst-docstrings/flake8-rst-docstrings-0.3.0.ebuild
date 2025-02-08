# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="develop"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flake8-rst-docstrings/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build ; extra == 'develop'
	flake8 (>=3)
	pygments
	restructuredtext-lint
	twine ; extra == 'develop'
"
GENERATED_RDEPEND="${RDEPEND}
	develop? ( dev-python/build[${PYTHON_USEDEP}] )
	>=dev-python/flake8-3[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/restructuredtext-lint[${PYTHON_USEDEP}]
	develop? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
