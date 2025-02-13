# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all jenkins setup stylecheck"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cupy-cuda101/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	stylecheck? ( ~dev-python/autopep8-1.5.5[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/codecov[${PYTHON_USEDEP}] )
	jenkins? ( <dev-python/coverage-5[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/coveralls[${PYTHON_USEDEP}] )
	all? ( <dev-python/cython-3[${PYTHON_USEDEP}] )
	setup? ( <dev-python/cython-3[${PYTHON_USEDEP}] )
	>=dev-python/fastrlock-0.5[${PYTHON_USEDEP}]
	setup? ( >=dev-python/fastrlock-0.5[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/flake8-3.8.4[${PYTHON_USEDEP}] )
	<dev-python/numpy-1.24[${PYTHON_USEDEP}]
	all? ( >=dev-python/optuna-2.0[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/pbr-5.5.1[${PYTHON_USEDEP}] )
	stylecheck? ( ~dev-python/pycodestyle-2.6.0[${PYTHON_USEDEP}] )
	jenkins? ( >=dev-python/pytest-6.2[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	jenkins? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	all? ( <dev-python/scipy-1.10[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/pytest-6.2[${PYTHON_USEDEP}]
)"
