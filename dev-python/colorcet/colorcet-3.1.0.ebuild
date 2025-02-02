# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all doc examples tests_examples tests_extra"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/colorcet/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	examples? ( dev-python/bokeh[${PYTHON_USEDEP}] )
	all? ( dev-python/colorcet[doc,${PYTHON_USEDEP}] )
	all? ( dev-python/colorcet[examples,${PYTHON_USEDEP}] )
	all? ( dev-python/colorcet[tests,${PYTHON_USEDEP}] )
	all? ( dev-python/colorcet[tests_extra,${PYTHON_USEDEP}] )
	doc? ( dev-python/colorcet[examples,${PYTHON_USEDEP}] )
	tests_examples? ( dev-python/colorcet[examples,${PYTHON_USEDEP}] )
	tests_extra? ( dev-python/colorcet[tests,${PYTHON_USEDEP}] )
	examples? ( dev-python/holoviews[${PYTHON_USEDEP}] )
	examples? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/nbsite-0.8.4[${PYTHON_USEDEP}] )
	tests_examples? ( dev-python/nbval[${PYTHON_USEDEP}] )
	examples? ( dev-python/numpy[${PYTHON_USEDEP}] )
	tests_extra? ( dev-python/pytest-mpl[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pytest-2.8.5[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
