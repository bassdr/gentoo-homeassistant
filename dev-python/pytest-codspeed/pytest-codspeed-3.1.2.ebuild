# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="compat lint"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-codspeed/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	lint? ( ~dev-python/mypy-1.11.2[${PYTHON_USEDEP}] )
	>=dev-python/pytest-3.8[${PYTHON_USEDEP}]
	compat? ( ~dev-python/pytest-benchmark-5.0.0[${PYTHON_USEDEP}] )
	compat? ( ~dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}] )
	>=dev-python/rich-13.8.1[${PYTHON_USEDEP}]
	lint? ( ~dev-python/ruff-0.6.5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/pytest-7.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
)"
