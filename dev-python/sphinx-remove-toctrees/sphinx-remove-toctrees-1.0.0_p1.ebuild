# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code-style docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 1.0.0.post1)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-1.0.0.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-remove-toctrees/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	ipython; extra == 'docs'
	ipython; extra == 'tests'
	myst-parser; extra == 'docs'
	myst-parser; extra == 'tests'
	pre-commit>=2.12; extra == 'code-style'
	pytest; extra == 'tests'
	sphinx-book-theme; extra == 'docs'
	sphinx-book-theme; extra == 'tests'
	sphinx>=5
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	code-style? ( >=dev-vcs/pre-commit-2.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/sphinx-book-theme[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
