# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="optional"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/slack-sdk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	optional? ( >dev-python/aiodns-1.0[${PYTHON_USEDEP}] )
	optional? ( <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	optional? ( <=dev-python/boto3-2[${PYTHON_USEDEP}] )
	optional? ( <dev-python/sqlalchemy-3[${PYTHON_USEDEP}] )
	optional? ( <dev-python/websocket-client-2[${PYTHON_USEDEP}] )
	optional? ( <dev-python/websockets-15[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
