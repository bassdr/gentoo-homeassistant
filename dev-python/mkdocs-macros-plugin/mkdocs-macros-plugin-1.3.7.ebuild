# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-macros-plugin/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/hjson[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-0.17[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pathspec[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/super-collections[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/mkdocs-d2-plugin[${PYTHON_USEDEP}]
	dev-python/mkdocs-include-markdown-plugin[${PYTHON_USEDEP}]
	dev-python/mkdocs-macros-test[${PYTHON_USEDEP}]
	>=dev-python/mkdocs-material-6.2[${PYTHON_USEDEP}]
	dev-python/mkdocs-test[${PYTHON_USEDEP}]
)"
