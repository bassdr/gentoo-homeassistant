# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all dev doc medical plot style test typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fury/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	all? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all? ( dev-python/data-science-types[${PYTHON_USEDEP}] )
	typing? ( dev-python/data-science-types[${PYTHON_USEDEP}] )
	all? ( dev-python/dipy[${PYTHON_USEDEP}] )
	medical? ( dev-python/dipy[${PYTHON_USEDEP}] )
	all? ( dev-python/gitpython[${PYTHON_USEDEP}] )
	dev? ( dev-python/gitpython[${PYTHON_USEDEP}] )
	>=dev-python/lazy-loader-0.4[${PYTHON_USEDEP}]
	all? ( >=dev-python/matplotlib-1.5.3[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/matplotlib-1.5.3[${PYTHON_USEDEP}] )
	plot? ( >=dev-python/matplotlib-1.5.3[${PYTHON_USEDEP}] )
	all? ( dev-python/mypy[${PYTHON_USEDEP}] )
	typing? ( dev-python/mypy[${PYTHON_USEDEP}] )
	all? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	medical? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	all? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	>=dev-python/packaging-17.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/pygltflib-1.15.3[${PYTHON_USEDEP}]
	all? ( !=dev-python/pytest-5.3.4[${PYTHON_USEDEP}] )
	test? ( !=dev-python/pytest-5.3.4[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-doctestplus[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-doctestplus[${PYTHON_USEDEP}] )
	all? ( dev-python/ruff[${PYTHON_USEDEP}] )
	style? ( dev-python/ruff[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/sphinx-6.1.2[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-6.1.2[${PYTHON_USEDEP}] )
	all? ( dev-python/texext[${PYTHON_USEDEP}] )
	doc? ( dev-python/texext[${PYTHON_USEDEP}] )
	all? ( dev-python/twine[${PYTHON_USEDEP}] )
	dev? ( dev-python/twine[${PYTHON_USEDEP}] )
	all? ( dev-python/types-pillow[${PYTHON_USEDEP}] )
	typing? ( dev-python/types-pillow[${PYTHON_USEDEP}] )
	<dev-python/vtk-9.4.0[${PYTHON_USEDEP}]
	all? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	style? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest