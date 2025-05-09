# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cache test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-check-links/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	docutils>=0.20.1
	flaky; extra == 'test'
	html5lib>=1.1
	nbconvert>=7.1
	nbformat>=5.1
	pre-commit; extra == 'test'
	pytest<9,>=7.0
	requests-cache>=0.9.7; extra == 'cache'
	requests-cache>=0.9.7; extra == 'test'
	requests>=2.22
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/docutils-0.20.1[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-7.1[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
	cache? ( >=dev-python/requests-cache-0.9.7[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		>=dev-python/requests-cache-0.9.7[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
