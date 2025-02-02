# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli fastapi flask"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fief-client/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	fastapi? ( dev-python/fastapi[${PYTHON_USEDEP}] )
	flask? ( dev-python/flask[${PYTHON_USEDEP}] )
	<dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	<dev-python/jwcrypto-2.0.0[${PYTHON_USEDEP}]
	fastapi? ( <dev-python/makefun-2.0.0[${PYTHON_USEDEP}] )
	cli? ( dev-python/yaspin[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
