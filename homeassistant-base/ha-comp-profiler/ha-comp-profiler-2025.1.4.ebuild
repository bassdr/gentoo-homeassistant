EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.profiler"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	$(python_gen_cond_dep '~dev-python/guppy3-3.1.4_p1[${PYTHON_USEDEP}]' python3_12)
	~dev-python/objgraph-3.5.0[${PYTHON_USEDEP}]
	~dev-python/pyprof2calltree-1.4.5[${PYTHON_USEDEP}]
	=homeassistant-base/ha-core-2025.1.4
"
