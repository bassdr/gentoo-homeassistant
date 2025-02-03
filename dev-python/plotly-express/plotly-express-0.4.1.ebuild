# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/plotly-express/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.11[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/patsy-0.5[${PYTHON_USEDEP}]
	>=dev-python/plotly-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.18[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
