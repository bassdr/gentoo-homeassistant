# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs markdown notebook"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ablog/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( >=dev-python/alabaster-1.0.0[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.18[${PYTHON_USEDEP}]
	>=dev-python/feedgen-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/invoke-1.6.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/ipython-7.30.0[${PYTHON_USEDEP}] )
	notebook? ( >=dev-python/ipython-7.30.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/myst-parser-0.17.0[${PYTHON_USEDEP}] )
	markdown? ( >=dev-python/myst-parser-0.17.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/nbsphinx-0.8.0[${PYTHON_USEDEP}] )
	notebook? ( >=dev-python/nbsphinx-0.8.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-19.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/sphinx-6.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-automodapi[${PYTHON_USEDEP}] )
	>=dev-python/watchdog-2.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/alabaster-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.8.0_rc2[${PYTHON_USEDEP}]
	>=dev-python/ipython-7.30.0[${PYTHON_USEDEP}]
	>=dev-python/myst-parser-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/nbsphinx-0.8.0[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/sphinx-automodapi[${PYTHON_USEDEP}]
)"
