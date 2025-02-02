# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="gurobi"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mip/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/cffi-1.15[${PYTHON_USEDEP}]
	gurobi? ( >=dev-python/gurobipy-8[${PYTHON_USEDEP}] )
	~dev-python/matplotlib-3.5.3[${PYTHON_USEDEP}]
	~dev-python/matplotlib-3.6.2[${PYTHON_USEDEP}]
	~dev-python/networkx-2.6.3[${PYTHON_USEDEP}]
	~dev-python/networkx-2.8.8[${PYTHON_USEDEP}]
	~dev-python/numpy-1.21.6[${PYTHON_USEDEP}]
	~dev-python/numpy-1.24[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
)"
