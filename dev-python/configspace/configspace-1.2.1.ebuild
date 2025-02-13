# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs tooling"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ConfigSpace/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	docs? ( dev-python/black[${PYTHON_USEDEP}] )
	docs? ( dev-python/cairosvg[${PYTHON_USEDEP}] )
	docs? ( dev-python/markdown-exec[ansi,${PYTHON_USEDEP}] )
	docs? ( dev-python/mike[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-autorefs[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-gen-files[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-glightbox[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-literate-nav[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-material[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocstrings[python,${PYTHON_USEDEP}] )
	dev-python/more-itertools[${PYTHON_USEDEP}]
	tooling? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev-python/numpy[${PYTHON_USEDEP}]
	docs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	dev-python/pyparsing[${PYTHON_USEDEP}]
	tooling? ( dev-python/ruff[${PYTHON_USEDEP}] )
	dev-python/scipy[${PYTHON_USEDEP}]
	tooling? ( dev-python/types-pyyaml[${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	tooling? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/configspace[docs,test,tooling,${PYTHON_USEDEP}]
	>=dev-python/pytest-7[${PYTHON_USEDEP}]
	dev-python/pytest-cases[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
)"
