# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sacred/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/colorama-0.4[${PYTHON_USEDEP}]
	<dev-python/docopt-ng-1.0[${PYTHON_USEDEP}]
	dev-python/gitpython[${PYTHON_USEDEP}]
	>=dev-python/jsonpickle-2.2.0[${PYTHON_USEDEP}]
	<dev-python/munch-5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-18.0[${PYTHON_USEDEP}]
	>=dev-python/py-cpuinfo-4.0[${PYTHON_USEDEP}]
	<dev-python/wrapt-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
