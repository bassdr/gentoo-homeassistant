EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.tensorflow"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/numpy-2.1.3[${PYTHON_USEDEP}]
	~dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	~dev-python/pycocotools-2.0.6[${PYTHON_USEDEP}]
	~dev-python/tensorflow-2.5.0[${PYTHON_USEDEP}]
	~dev-python/tf-models-official-2.5.0[${PYTHON_USEDEP}]
"
