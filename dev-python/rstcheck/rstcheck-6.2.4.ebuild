# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs sphinx type-check"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/rstcheck/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	type-check? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/myst-parser-3[${PYTHON_USEDEP}] )
	>=dev-python/rstcheck-core-1.1[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autobuild-2021.3.14[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-click-4.0.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-spelling-7.3[${PYTHON_USEDEP}] )
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/coverage-6.0[toml,${PYTHON_USEDEP}]
	>=dev-python/coverage-conditional-plugin-0.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-7.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-3.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-randomly-3.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-sugar-0.9.5[${PYTHON_USEDEP}]
	dev-python/rstcheck[docs,sphinx,testing,toml,type-check,${PYTHON_USEDEP}]
	>=dev-python/tox-3.15[${PYTHON_USEDEP}]
)"
