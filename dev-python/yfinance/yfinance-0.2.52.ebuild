# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="nospam repair"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/yfinance/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}]
	>=dev-python/frozendict-2.3.4[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9.1[${PYTHON_USEDEP}]
	>=dev-python/multitasking-0.0.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.5[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.16.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	nospam? ( >=dev-python/requests-cache-1.0[${PYTHON_USEDEP}] )
	nospam? ( >=dev-python/requests-ratelimiter-0.3.1[${PYTHON_USEDEP}] )
	repair? ( >=dev-python/scipy-1.6.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest