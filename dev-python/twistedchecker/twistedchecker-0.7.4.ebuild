# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/twistedchecker/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage ; extra == 'dev'
	pyflakes ; extra == 'dev'
	pylint (>=2.4.4)
	twisted (>=15.0.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pylint-2.4.4[${PYTHON_USEDEP}]
	>=dev-python/twisted-15.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pyflakes[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
