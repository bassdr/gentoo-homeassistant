# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all dates"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/domdf-python-tools/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/importlib-metadata-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-resources-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/natsort-7.0.1[${PYTHON_USEDEP}]
	all? ( >=dev-python/pytz-2019.1[${PYTHON_USEDEP}] )
	dates? ( >=dev-python/pytz-2019.1[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7.4.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest