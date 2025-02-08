# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs proxy pydantic testqt"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/psygnal/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs; extra == "dev"
	attrs; extra == "test"
	dask[array]>=2024.0.0; extra == "dev"
	dask[array]>=2024.0.0; extra == "test"
	griffe==0.25.5; extra == "docs"
	ipython; extra == "dev"
	mkdocs-material==8.5.10; extra == "docs"
	mkdocs-minify-plugin; extra == "docs"
	mkdocs-spellcheck[all]; extra == "docs"
	mkdocs==1.4.2; extra == "docs"
	mkdocstrings-python==0.8.3; extra == "docs"
	mkdocstrings==0.20.0; extra == "docs"
	msgspec; extra == "dev"
	msgspec; extra == "test"
	mypy-extensions; extra == "dev"
	mypy; extra == "dev"
	numpy>1.21.6; extra == "dev"
	numpy>1.21.6; extra == "test"
	pre-commit; extra == "dev"
	pydantic; extra == "dev"
	pydantic; extra == "pydantic"
	pydantic; extra == "test"
	pyinstaller>=4.0; extra == "dev"
	pyinstaller>=4.0; extra == "test"
	pyqt6; extra == "dev"
	pytest-cov; extra == "dev"
	pytest-cov; extra == "test"
	pytest-mypy-plugins; extra == "dev"
	pytest-qt; extra == "dev"
	pytest-qt; extra == "testqt"
	pytest>=6.0; extra == "dev"
	pytest>=6.0; extra == "test"
	qtpy; extra == "dev"
	qtpy; extra == "testqt"
	rich; extra == "dev"
	ruff; extra == "dev"
	toolz; extra == "dev"
	toolz; extra == "test"
	typing-extensions; extra == "dev"
	wrapt; extra == "dev"
	wrapt; extra == "proxy"
	wrapt; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( ~dev-python/griffe-0.25.5[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/mkdocs-1.4.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/mkdocs-material-8.5.10[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-minify-plugin[${PYTHON_USEDEP}] )
	docs? ( dev-python/mkdocs-spellcheck[all,${PYTHON_USEDEP}] )
	docs? ( ~dev-python/mkdocstrings-0.20.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/mkdocstrings-python-0.8.3[${PYTHON_USEDEP}] )
	pydantic? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	testqt? ( dev-python/pytest-qt[${PYTHON_USEDEP}] )
	testqt? ( dev-python/qtpy[${PYTHON_USEDEP}] )
	proxy? ( dev-python/wrapt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/attrs[${PYTHON_USEDEP}]
		>=dev-python/dask-2024.0.0[array,${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/mypy-extensions[${PYTHON_USEDEP}]
		>dev-python/numpy-1.21.6[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		>=dev-python/pyinstaller-4.0[${PYTHON_USEDEP}]
		dev-python/pyqt6[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mypy-plugins[${PYTHON_USEDEP}]
		dev-python/pytest-qt[${PYTHON_USEDEP}]
		dev-python/qtpy[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/toolz[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/wrapt[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
