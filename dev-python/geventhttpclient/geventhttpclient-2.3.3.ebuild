# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmarks examples"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/geventhttpclient/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/brotli[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	benchmarks? ( dev-python/httplib2[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/httpx[${PYTHON_USEDEP}] )
	examples? ( dev-python/oauth2[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/requests[${PYTHON_USEDEP}] )
	benchmarks? ( dev-python/urllib3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/dpkt[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
)"
