# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev docs sphinx testing type-check yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rstcheck-core/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	testing? ( >=dev-python/coverage-6.0[toml,${PYTHON_USEDEP}] )
	testing? ( >=dev-python/coverage-conditional-plugin-0.5[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.7[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-1.6[${PYTHON_USEDEP}]
	docs? ( >=dev-python/m2r2-0.3.2[${PYTHON_USEDEP}] )
	type-check? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	testing? ( >=dev-python/pytest-7.2[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-cov-3.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-mock-3.7[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-randomly-3.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-sugar-0.9.5[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/rstcheck-core[docs,sphinx,testing,toml,type-check,yaml,${PYTHON_USEDEP}] )
	docs? ( !=dev-python/sphinx-7.2.5[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-1.15[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-apidoc-0.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-spelling-7.3[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/tox-3.15[${PYTHON_USEDEP}] )
	type-check? ( >=dev-python/types-docutils-0.18[${PYTHON_USEDEP}] )
	type-check? ( >=dev-python/types-pyyaml-6.0.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest