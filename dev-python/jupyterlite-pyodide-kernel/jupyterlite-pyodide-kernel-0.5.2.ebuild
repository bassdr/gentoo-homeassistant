# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyterlite-pyodide-kernel/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	docs? ( <dev-python/ipywidgets-9[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyter-server-mathjax[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyterlab-language-pack-fr-fr[${PYTHON_USEDEP}] )
	docs? ( dev-python/jupyterlab-language-pack-zh-cn[${PYTHON_USEDEP}] )
	<dev-python/jupyterlite-core-0.6.0[${PYTHON_USEDEP}]
	docs? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	dev-python/pkginfo[${PYTHON_USEDEP}]
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/ruff-0.3.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/hatch[${PYTHON_USEDEP}]
	<dev-python/jupyterlab-4.4.0_alpha0[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	>=dev-python/pytest-console-scripts-1.4.0[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-html[${PYTHON_USEDEP}]
)"
