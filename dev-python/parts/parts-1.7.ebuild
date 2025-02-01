# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="coveralls docs lint publish"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/parts/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	publish? ( ~dev-python/build-0.10[${PYTHON_USEDEP}] )
	coveralls? ( ~dev-python/coveralls-3.3.1[${PYTHON_USEDEP}] )
	lint? ( ~dev-python/pylint-2.17.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-4.2.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-autodoc-typehints-1.12.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/toml-0.10.2[${PYTHON_USEDEP}] )
	publish? ( ~dev-python/twine-4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/pytest-7.2[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-4.0[${PYTHON_USEDEP}]
)"
