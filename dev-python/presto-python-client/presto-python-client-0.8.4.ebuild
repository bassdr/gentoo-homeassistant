# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all google_auth kerberos"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/presto-python-client/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/click[${PYTHON_USEDEP}]
	all? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	google_auth? ( dev-python/google-auth[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
	all? ( dev-python/requests-kerberos[${PYTHON_USEDEP}] )
	kerberos? ( dev-python/requests-kerberos[${PYTHON_USEDEP}] )
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/httpretty[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	dev-python/requests-kerberos[${PYTHON_USEDEP}]
)"
