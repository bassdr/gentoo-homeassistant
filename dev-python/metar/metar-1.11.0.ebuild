# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Metar - a package to parse METAR-coded weather reports"
HOMEPAGE="
  https://pypi.org/project/metar/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"


EPYTEST_XDIST=1
distutils_enable_tests pytest
REQUIRES_DIST="
	pytest ; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
