# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="examples numpy orjson pandas rapidjson ujson"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyexasol/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	numpy? ( <dev-python/numpy-2[${PYTHON_USEDEP}] )
	orjson? ( >=dev-python/orjson-3.6[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	pandas? ( <dev-python/pandas-3[numpy,${PYTHON_USEDEP}] )
	examples? ( dev-python/pproxy[${PYTHON_USEDEP}] )
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	rapidjson? ( dev-python/python-rapidjson[${PYTHON_USEDEP}] )
	dev-python/rsa[${PYTHON_USEDEP}]
	ujson? ( dev-python/ujson[${PYTHON_USEDEP}] )
	>=dev-python/websocket-client-1.0.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
