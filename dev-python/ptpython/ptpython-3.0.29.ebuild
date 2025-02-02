# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all ptipython"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ptpython/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/appdirs[${PYTHON_USEDEP}]
	all? ( dev-python/black[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	ptipython? ( dev-python/ipython[${PYTHON_USEDEP}] )
	>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-3.1.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
