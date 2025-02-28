# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytype/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	attrs>=21.4.0
	immutabledict>=4.1.0
	importlab>=0.8
	jinja2>=3.1.2
	libcst>=1.0.1
	msgspec>=0.18.6
	networkx>=2.8
	ninja>=1.10.0.post2
	pycnite>=2024.07.31
	pydot>=1.4.2
	tabulate>=0.8.10
	toml>=0.10.2
	typing-extensions>=4.3.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-21.4.0[${PYTHON_USEDEP}]
	>=dev-python/immutabledict-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/importlab-0.8[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/libcst-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/msgspec-0.18.6[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.8[${PYTHON_USEDEP}]
	>=dev-build/ninja-1.10.0_p2[${PYTHON_USEDEP}]
	>=dev-python/pycnite-2024.07.31[${PYTHON_USEDEP}]
	>=dev-python/pydot-1.4.2[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.10[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
