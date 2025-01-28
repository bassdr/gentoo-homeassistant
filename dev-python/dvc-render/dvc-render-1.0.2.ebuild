# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev docs markdown table tests"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-render/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/dvc-render[docs,tests,${PYTHON_USEDEP}] )
	markdown? ( dev-python/dvc-render[table,${PYTHON_USEDEP}] )
	tests? ( dev-python/dvc-render[markdown,table,${PYTHON_USEDEP}] )
	table? ( <dev-python/flatten-dict-1[${PYTHON_USEDEP}] )
	markdown? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mkdocs-2[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mkdocs-gen-files-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mkdocs-material-10[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mkdocs-section-index-1[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mkdocstrings-python-2[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/mypy-1.9.0[${PYTHON_USEDEP}] )
	tests? ( <dev-python/pytest-9[${PYTHON_USEDEP}] )
	tests? ( >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	tests? ( dev-python/pytest-sugar[${PYTHON_USEDEP}] )
	table? ( >=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest