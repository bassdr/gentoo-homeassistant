# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc docs test-benchmark test-cov"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/spglib/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/linkify-it-py[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-2.0[${PYTHON_USEDEP}] )
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	test-benchmark? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	test-cov? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	doc? ( dev-python/spglib[docs,${PYTHON_USEDEP}] )
	test-benchmark? ( dev-python/spglib[test,${PYTHON_USEDEP}] )
	test-cov? ( dev-python/spglib[test,${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc2[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-bibtex-2.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/spglib[test,${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
