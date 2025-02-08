# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="coveralls docs lint publish"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fe25519/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bitlist ~=1.2 ; extra == 'test'
	build ~=0.10 ; extra == 'publish'
	coveralls ~=3.3.1 ; extra == 'coveralls'
	fountains ~=2.2 ; extra == 'test'
	parts ~=1.7 ; extra == 'test'
	pylint ~=2.17.0 ; extra == 'lint'
	pytest ~=7.2 ; extra == 'test'
	pytest-cov ~=4.0 ; extra == 'test'
	sphinx ~=4.2.0 ; extra == 'docs'
	sphinx-rtd-theme ~=1.0.0 ; extra == 'docs'
	toml ~=0.10.2 ; extra == 'docs'
	twine ~=4.0 ; extra == 'publish'
"
GENERATED_RDEPEND="${RDEPEND}
	publish? ( >=dev-python/build-0.10[${PYTHON_USEDEP}] =dev-python/build-0*[${PYTHON_USEDEP}] )
	coveralls? ( >=dev-python/coveralls-3.3.1[${PYTHON_USEDEP}] =dev-python/coveralls-3.3*[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/pylint-2.17.0[${PYTHON_USEDEP}] =dev-python/pylint-2.17*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.2.0[${PYTHON_USEDEP}] =dev-python/sphinx-4.2*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] =dev-python/sphinx-rtd-theme-1.0*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/toml-0.10.2[${PYTHON_USEDEP}] =dev-python/toml-0.10*[${PYTHON_USEDEP}] )
	publish? ( >=dev-python/twine-4.0[${PYTHON_USEDEP}] =dev-python/twine-4*[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/bitlist-1.2[${PYTHON_USEDEP}] =dev-python/bitlist-1*[${PYTHON_USEDEP}]
		>=dev-python/fountains-2.2[${PYTHON_USEDEP}] =dev-python/fountains-2*[${PYTHON_USEDEP}]
		>=dev-python/parts-1.7[${PYTHON_USEDEP}] =dev-python/parts-1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0[${PYTHON_USEDEP}] =dev-python/pytest-cov-4*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
