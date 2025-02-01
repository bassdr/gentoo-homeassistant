# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="langsmith-pyo3 pytest"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langsmith/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	langsmith-pyo3? ( <dev-python/langsmith-pyo3-0.2.0[${PYTHON_USEDEP}] )
	<dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	pytest? ( >=dev-python/pytest-7.0.0[${PYTHON_USEDEP}] )
	<dev-python/requests-3[${PYTHON_USEDEP}]
	<dev-python/requests-toolbelt-2.0.0[${PYTHON_USEDEP}]
	pytest? ( <dev-python/rich-14.0.0[${PYTHON_USEDEP}] )
	<dev-python/zstandard-0.24.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
