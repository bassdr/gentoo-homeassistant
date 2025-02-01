# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fissix/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-7.3.7[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.6.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/attribution-1.7.1[${PYTHON_USEDEP}]
	~dev-python/black-24.4.0[${PYTHON_USEDEP}]
	~dev-python/flit-3.9.0[${PYTHON_USEDEP}]
	~dev-python/isort-5.8.0[${PYTHON_USEDEP}]
	~dev-python/pytest-8.1.1[${PYTHON_USEDEP}]
)"
