# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hupper/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx ; extra == 'docs'
	mock ; extra == 'testing'
	pylons-sphinx-themes ; extra == 'docs'
	pytest ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	setuptools ; extra == 'docs'
	watchdog ; extra == 'docs'
	watchdog ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/pylons-sphinx-themes[${PYTHON_USEDEP}] )
	docs? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/watchdog[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/watchdog[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
