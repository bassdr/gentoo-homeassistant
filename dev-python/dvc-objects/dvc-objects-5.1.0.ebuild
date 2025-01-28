# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-objects/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/dvc-objects[tests,${PYTHON_USEDEP}] )
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/funcy-1.14[${PYTHON_USEDEP}]' python3_12)
	dev? ( ~dev-python/mypy-1.8.0[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-8[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-asyncio-1[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-sugar[${PYTHON_USEDEP}] )
	tests? ( dev-python/reflink[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest