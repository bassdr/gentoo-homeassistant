# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="sqlalchemy"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pinotdb/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/ciso8601-3.0.0[${PYTHON_USEDEP}]
	<dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	sqlalchemy? ( <dev-python/requests-3.0.0[${PYTHON_USEDEP}] )
	sqlalchemy? ( <dev-python/sqlalchemy-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
