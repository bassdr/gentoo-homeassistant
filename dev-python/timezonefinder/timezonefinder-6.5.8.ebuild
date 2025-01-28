# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="pytz"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/timezonefinder/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	<dev-python/cffi-2[${PYTHON_USEDEP}]
	>dev-python/h3-4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '<dev-python/numba-1[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '<dev-python/numba-1[${PYTHON_USEDEP}]' python3_13{,t})
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	pytz? ( >=dev-python/pytz-2022.7.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest