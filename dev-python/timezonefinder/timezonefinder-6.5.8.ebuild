# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="numba pytz"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/timezonefinder/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	cffi<2,>=1.15.1
	h3>4
	numba<1,>=0.56; python_version < '3.12' and extra == 'numba'
	numba<1,>=0.59; python_version >= '3.12' and extra == 'numba'
	numpy<3,>=1.21; python_version < '3.9'
	numpy<3,>=1.23; python_version >= '3.9'
	pytz>=2022.7.1; extra == 'pytz'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.15.1[${PYTHON_USEDEP}] <dev-python/cffi-2[${PYTHON_USEDEP}]
	>dev-python/h3-4[${PYTHON_USEDEP}]
	numba? ( >=dev-python/numba-0.59[${PYTHON_USEDEP}] <dev-python/numba-1[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}] <dev-python/numpy-3[${PYTHON_USEDEP}]
	pytz? ( >=dev-python/pytz-2022.7.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

