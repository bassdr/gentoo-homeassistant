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
  https://pypi.org/project/flake8-black/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black (>=22.1.0)
	build ; extra == 'develop'
	flake8 (>=3)
	tomli ; python_version < '3.11'
	twine ; extra == 'develop'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/black-22.1.0[${PYTHON_USEDEP}]
	develop? ( dev-python/build[${PYTHON_USEDEP}] )
	>=dev-python/flake8-3[${PYTHON_USEDEP}]
	develop? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
