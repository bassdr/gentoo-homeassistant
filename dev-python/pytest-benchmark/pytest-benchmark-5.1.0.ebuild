# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="aspect elasticsearch histogram"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-benchmark/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aspectlib; extra == "aspect"
	elasticsearch; extra == "elasticsearch"
	pathlib2; python_version < "3.4"
	py-cpuinfo
	pygal; extra == "histogram"
	pygaljs; extra == "histogram"
	pytest>=8.1
	setuptools; extra == "histogram"
	statistics; python_version < "3.4"
"
GENERATED_RDEPEND="${RDEPEND}
	aspect? ( dev-python/aspectlib[${PYTHON_USEDEP}] )
	elasticsearch? ( dev-python/elasticsearch[${PYTHON_USEDEP}] )
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	histogram? ( dev-python/pygal[${PYTHON_USEDEP}] )
	histogram? ( dev-python/pygaljs[${PYTHON_USEDEP}] )
	>=dev-python/pytest-8.1[${PYTHON_USEDEP}]
	histogram? ( dev-python/setuptools[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
