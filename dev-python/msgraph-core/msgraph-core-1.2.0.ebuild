# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/msgraph-core/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/bumpver[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.23.0[http2,${PYTHON_USEDEP}]
	dev? ( dev-python/isort[${PYTHON_USEDEP}] )
	<dev-python/microsoft-kiota-abstractions-2.0.0[${PYTHON_USEDEP}]
	<dev-python/microsoft-kiota-authentication-azure-2.0.0[${PYTHON_USEDEP}]
	<dev-python/microsoft-kiota-http-2.0.0[${PYTHON_USEDEP}]
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/pylint[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev? ( dev-python/yapf[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest