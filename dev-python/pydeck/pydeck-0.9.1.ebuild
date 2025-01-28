# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="carto jupyter"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydeck/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/ipython-5.8.0[${PYTHON_USEDEP}]
	jupyter? ( <dev-python/ipywidgets-8[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.4[${PYTHON_USEDEP}]
	carto? ( dev-python/pydeck-carto[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/traitlets-4.3.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest