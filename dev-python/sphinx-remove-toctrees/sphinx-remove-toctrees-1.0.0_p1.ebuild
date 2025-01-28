# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="code-style docs tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "sphinx-remove-toctrees" "1.0.0.post1")"
S="${WORKDIR}/sphinx-remove-toctrees-1.0.0.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-remove-toctrees/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	tests? ( dev-python/ipython[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	tests? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-5[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	tests? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	code-style? ( >=dev-vcs/pre-commit-2.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest