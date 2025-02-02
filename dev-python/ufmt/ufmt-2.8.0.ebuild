# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs lsp ruff"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ufmt/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/black-20_beta0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/libcst-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/moreorless-0.4.0[${PYTHON_USEDEP}]
	lsp? ( >=dev-python/pygls-1.3[${PYTHON_USEDEP}] )
	ruff? ( >=dev-python/ruff-api-0.1.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-8.0.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.6.2[${PYTHON_USEDEP}] )
	>=dev-python/tomlkit-0.7.2[${PYTHON_USEDEP}]
	>=dev-python/trailrunner-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	>=dev-python/usort-1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/attribution-1.8.0[${PYTHON_USEDEP}]
	~dev-python/black-24.8.0[${PYTHON_USEDEP}]
	>=dev-python/build-1.2[${PYTHON_USEDEP}]
	>=dev-python/coverage-7[${PYTHON_USEDEP}]
	~dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
	~dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
	~dev-python/pygls-1.3.1[${PYTHON_USEDEP}]
	~dev-python/ruff-api-0.1.0[${PYTHON_USEDEP}]
	~dev-python/usort-1.0.8_p1[${PYTHON_USEDEP}]
)"
