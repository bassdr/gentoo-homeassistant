# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="attrs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/erdantic/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	attrs? ( dev-python/attrs[${PYTHON_USEDEP}] )
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	dev-python/pydantic-core[${PYTHON_USEDEP}]
	dev-python/pygraphviz[${PYTHON_USEDEP}]
	dev-python/sortedcontainers-pydantic[${PYTHON_USEDEP}]
	>=dev-python/typenames-1.3[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>dev-python/typing-extensions-4[${PYTHON_USEDEP}]' python3_12)
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
