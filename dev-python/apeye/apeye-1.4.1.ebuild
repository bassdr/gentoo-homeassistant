# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all limiter"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/apeye/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	apeye-core>=1.0.0b2
	cachecontrol[filecache]>=0.12.6 ; extra == "all"
	cachecontrol[filecache]>=0.12.6 ; extra == "limiter"
	domdf-python-tools>=2.6.0
	lockfile>=0.12.2 ; extra == "all"
	lockfile>=0.12.2 ; extra == "limiter"
	platformdirs>=2.3.0
	requests>=2.24.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/apeye-core-1.0.0_beta2[${PYTHON_USEDEP}]
	all? ( >=dev-python/cachecontrol-0.12.6[filecache,${PYTHON_USEDEP}] )
	limiter? ( >=dev-python/cachecontrol-0.12.6[filecache,${PYTHON_USEDEP}] )
	>=dev-python/domdf-python-tools-2.6.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}] )
	limiter? ( >=dev-python/lockfile-0.12.2[${PYTHON_USEDEP}] )
	>=dev-python/platformdirs-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
