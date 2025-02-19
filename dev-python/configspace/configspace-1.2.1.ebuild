# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test tooling"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/configspace/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	ConfigSpace[docs,test,tooling]; extra == 'dev'
	black; extra == 'docs'
	cairosvg; extra == 'docs'
	markdown-exec[ansi]; extra == 'docs'
	mike; extra == 'docs'
	mkdocs-autorefs; extra == 'docs'
	mkdocs-gen-files; extra == 'docs'
	mkdocs-glightbox; extra == 'docs'
	mkdocs-literate-nav; extra == 'docs'
	mkdocs-material; extra == 'docs'
	mkdocs; extra == 'docs'
	mkdocstrings[python]; extra == 'docs'
	more_itertools
	mypy; extra == 'tooling'
	numpy
	pillow; extra == 'docs'
	pre-commit; extra == 'tooling'
	pyparsing
	pytest-cov; extra == 'test'
	pytest>=7; extra == 'test'
	pytest_cases; extra == 'test'
	ruff; extra == 'tooling'
	scipy
	types-pyyaml; extra == 'tooling'
	typing_extensions
"
GENERATED_RDEPEND="${RDEPEND}
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
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/configspace[docs,test,tooling,${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}]
		dev-python/pytest-cases[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
