# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pymongocrypt/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/cffi-2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/cffi-2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2[${PYTHON_USEDEP}]
	>=dev-python/pymongo-4[aws,${PYTHON_USEDEP}]
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
	dev-python/respx[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/unasync[${PYTHON_USEDEP}]
)"
