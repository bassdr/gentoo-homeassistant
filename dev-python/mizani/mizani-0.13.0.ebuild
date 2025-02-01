# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all build doc lint rtd typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mizani/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[build,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[dev,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[doc,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[lint,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[test,${PYTHON_USEDEP}] )
	rtd? ( dev-python/mock[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
	doc? ( >=dev-python/numpydoc-1.7.0[${PYTHON_USEDEP}] )
	>=dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
	typing? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	typing? ( ~dev-python/pyright-1.1.386[${PYTHON_USEDEP}] )
	lint? ( dev-python/ruff[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.8.0[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-7.2.0[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/mizani[typing,${PYTHON_USEDEP}]
	dev-python/notebook[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
