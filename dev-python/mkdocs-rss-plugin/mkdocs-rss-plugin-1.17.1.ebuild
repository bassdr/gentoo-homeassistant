# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-rss-plugin/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/cachecontrol-1[filecache,${PYTHON_USEDEP}]
	<dev-python/gitpython-3.2[${PYTHON_USEDEP}]
	<dev-python/mkdocs-2[${PYTHON_USEDEP}]
	doc? ( <dev-python/mkdocs-git-committers-plugin_2-2.5[${PYTHON_USEDEP}] )
	doc? ( <dev-python/mkdocs-git-revision-date-localized-plugin-1.4[${PYTHON_USEDEP}] )
	doc? ( <dev-python/mkdocs-material-10[imaging,${PYTHON_USEDEP}] )
	doc? ( <dev-python/mkdocs-minify-plugin-0.9[${PYTHON_USEDEP}] )
	doc? ( <dev-python/mkdocstrings-1[python,${PYTHON_USEDEP}] )
	<dev-python/requests-3[${PYTHON_USEDEP}]
	doc? ( <dev-python/termynal-0.13[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	<dev-python/feedparser-6.1[${PYTHON_USEDEP}]
	<dev-python/flake8-8[${PYTHON_USEDEP}]
	>=dev-python/flake8-bugbear-24.10[${PYTHON_USEDEP}]
	>=dev-python/flake8-builtins-2.5[${PYTHON_USEDEP}]
	>=dev-python/flake8-eradicate-1.5[${PYTHON_USEDEP}]
	>=dev-python/flake8-isort-6.1.1[${PYTHON_USEDEP}]
	<dev-python/jsonfeed-util-2[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-material-9.5.47[imaging,${PYTHON_USEDEP}]
	<dev-python/pytest-cov-7[${PYTHON_USEDEP}]
	<dev-python/validator-collection-1.6[${PYTHON_USEDEP}]
	<dev-vcs/pre-commit-4[${PYTHON_USEDEP}]
)"
