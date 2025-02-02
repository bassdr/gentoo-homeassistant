# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 1.6.0)"
S="${WORKDIR}/${PN}-1.6.0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-rss-plugin/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/gitpython-3.2[${PYTHON_USEDEP}]
	<dev-python/mkdocs-2[${PYTHON_USEDEP}]
	doc? ( <dev-python/mkdocs-bootswatch-2[${PYTHON_USEDEP}] )
	doc? ( ~dev-python/mkdocs-minify-plugin-0.5[${PYTHON_USEDEP}] )
	doc? ( <dev-python/pygments-3[${PYTHON_USEDEP}] )
	doc? ( <dev-python/pymdown-extensions-10[${PYTHON_USEDEP}] )
	~dev-python/pytz-2022[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/black[${PYTHON_USEDEP}]
	<dev-python/feedparser-6.1[${PYTHON_USEDEP}]
	<dev-python/flake8-6.1[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-4.0[${PYTHON_USEDEP}]
	<dev-python/validator-collection-1.6[${PYTHON_USEDEP}]
	<dev-vcs/pre-commit-3.1[${PYTHON_USEDEP}]
)"
