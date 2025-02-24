# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="parse test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/airium/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4 <5.0,>=4.10.0 ; extra == 'parse'
	pytest ~=6.2 ; extra == 'dev'
	pytest-cov ~=3.0 ; extra == 'dev'
	pytest-mock ~=3.6 ; extra == 'dev'
	requests <3,>=2.12.0 ; extra == 'parse'
"
GENERATED_RDEPEND="${RDEPEND}
	parse? ( >=dev-python/beautifulsoup4-4.10.0[${PYTHON_USEDEP}] <dev-python/beautifulsoup4-5.0[${PYTHON_USEDEP}] )
	parse? ( >=dev-python/requests-2.12.0[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6.2[${PYTHON_USEDEP}] =dev-python/pytest-6*[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0[${PYTHON_USEDEP}] =dev-python/pytest-cov-3*[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.6[${PYTHON_USEDEP}] =dev-python/pytest-mock-3*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
