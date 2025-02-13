# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-toolbox/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/apeye-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/autodocsumm-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.9.1[${PYTHON_USEDEP}]
	>=dev-python/cachecontrol-0.13.0[filecache,${PYTHON_USEDEP}]
	all? ( >=dev-python/coincidence-0.4.3[${PYTHON_USEDEP}] )
	>=dev-python/dict2css-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.16[${PYTHON_USEDEP}]
	>=dev-python/domdf-python-tools-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	all? ( <=dev-python/pygments-2.13.0[${PYTHON_USEDEP}] )
	>=dev-python/ruamel-yaml-0.16.12[${PYTHON_USEDEP}]
	>=dev-python/sphinx-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/sphinx-autodoc-typehints-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/sphinx-jinja2-compat-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/sphinx-prompt-1.1.0[${PYTHON_USEDEP}]
	<dev-python/sphinx-tabs-3.4.7[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}]
	!=dev-python/typing-extensions-3.10.0.1[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/coincidence-0.4.3[${PYTHON_USEDEP}]
	<=dev-python/pygments-2.13.0[${PYTHON_USEDEP}]
)"
