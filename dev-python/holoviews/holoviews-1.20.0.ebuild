# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="recommended"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/holoviews/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/bokeh-3.1[${PYTHON_USEDEP}]
	dev-python/colorcet[${PYTHON_USEDEP}]
	recommended? ( >=dev-python/matplotlib-3[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.21[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.3[${PYTHON_USEDEP}]
	>=dev-python/panel-1.0[${PYTHON_USEDEP}]
	<dev-python/param-3.0[${PYTHON_USEDEP}]
	recommended? ( >=dev-python/plotly-4.0[${PYTHON_USEDEP}] )
	>=dev-python/pyviz-comms-2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
)"
