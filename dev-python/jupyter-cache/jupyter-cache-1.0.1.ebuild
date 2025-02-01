# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="cli code-style rtd testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-cache/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	cli? ( dev-python/click-log[${PYTHON_USEDEP}] )
	testing? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	rtd? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	testing? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	rtd? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	testing? ( dev-python/jupytext[${PYTHON_USEDEP}] )
	testing? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-nb[${PYTHON_USEDEP}] )
	>=dev-python/nbclient-0.2[${PYTHON_USEDEP}]
	rtd? ( dev-python/nbdime[${PYTHON_USEDEP}] )
	testing? ( dev-python/nbdime[${PYTHON_USEDEP}] )
	dev-python/nbformat[${PYTHON_USEDEP}]
	testing? ( >=dev-python/nbformat-5.1[${PYTHON_USEDEP}] )
	testing? ( dev-python/numpy[${PYTHON_USEDEP}] )
	testing? ( dev-python/pandas[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-6[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	<dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	testing? ( dev-python/sympy[${PYTHON_USEDEP}] )
	dev-python/tabulate[${PYTHON_USEDEP}]
	code-style? ( >=dev-vcs/pre-commit-2.12[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
