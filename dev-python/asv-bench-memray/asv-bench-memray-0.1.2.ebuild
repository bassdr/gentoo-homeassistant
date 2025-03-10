# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="lint rel"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asv-bench-memray/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	asv-runner>=0.2.0
	memray>=1.7.0
	ruff>=0.0.265; extra == 'lint'
	tbump; extra == 'rel'
	towncrier; extra == 'rel'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asv-runner-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/memray-1.7.0[${PYTHON_USEDEP}]
	lint? ( >=dev-python/ruff-0.0.265[${PYTHON_USEDEP}] )
	rel? ( dev-python/tbump[${PYTHON_USEDEP}] )
	rel? ( dev-python/towncrier[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
