# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="aio"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/azure-storage-file-datalake/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	azure-core>=1.30.0
	azure-core[aio]>=1.30.0; extra == 'aio'
	azure-storage-blob>=12.24.1
	isodate>=0.6.1
	typing-extensions>=4.6.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/azure-core-1.30.0[${PYTHON_USEDEP}]
	aio? ( >=dev-python/azure-core-1.30.0[aio,${PYTHON_USEDEP}] )
	>=dev-python/azure-storage-blob-12.24.1[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
