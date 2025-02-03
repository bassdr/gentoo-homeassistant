# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all stylecheck"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cupy-cuda11x/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	stylecheck? ( =dev-python/autopep8-1.5.5[${PYTHON_USEDEP}] )
	all? ( <dev-python/cython-3[${PYTHON_USEDEP}] )
	>=dev-python/fastrlock-0.5[${PYTHON_USEDEP}]
	stylecheck? ( =dev-python/flake8-3.8.4[${PYTHON_USEDEP}] )
	stylecheck? ( =dev-python/mypy-1.4.1[${PYTHON_USEDEP}] )
	<dev-python/numpy-2.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/optuna-2.0[${PYTHON_USEDEP}] )
	stylecheck? ( =dev-python/pbr-5.5.1[${PYTHON_USEDEP}] )
	stylecheck? ( =dev-python/pycodestyle-2.6.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/scipy-1.14[${PYTHON_USEDEP}] )
	stylecheck? ( =dev-python/types-setuptools-57.4.14[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	app-arch/unzip
	test? (
		<dev-python/hypothesis-6.55.0[${PYTHON_USEDEP}]
		dev-python/mpmath[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
