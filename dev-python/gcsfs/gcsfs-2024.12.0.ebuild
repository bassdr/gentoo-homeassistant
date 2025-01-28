# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="crc gcsfuse"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gcsfs/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	!=dev-python/aiohttp-4.0.0_alpha0[${PYTHON_USEDEP}]
	crc? ( dev-python/crcmod[${PYTHON_USEDEP}] )
	>dev-python/decorator-4.1.2[${PYTHON_USEDEP}]
	~dev-python/fsspec-2024.12.0[${PYTHON_USEDEP}]
	gcsfuse? ( dev-python/fusepy[${PYTHON_USEDEP}] )
	>=dev-python/google-auth-1.2[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
	dev-python/google-cloud-storage[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest