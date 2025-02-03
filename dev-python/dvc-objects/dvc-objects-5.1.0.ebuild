# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-objects/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/funcy-1.14[${PYTHON_USEDEP}]' python3_12)
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/dvc-objects[tests,${PYTHON_USEDEP}]
		=dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
		<dev-python/pytest-8[${PYTHON_USEDEP}]
		<dev-python/pytest-asyncio-1[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/reflink[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
