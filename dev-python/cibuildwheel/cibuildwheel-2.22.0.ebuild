# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="uv"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cibuildwheel/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	bashlex!=0.13
	bracex
	certifi
	dependency-groups>=1.2
	filelock
	packaging>=20.9
	platformdirs
	tomli; python_version < "3.11"
	typing-extensions>=4.1.0; python_version < "3.11"
	uv; extra == "uv"
"
GENERATED_RDEPEND="${RDEPEND}
	!~dev-python/bashlex-0.13[${PYTHON_USEDEP}]
	dev-python/bracex[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/dependency-groups-1.2[${PYTHON_USEDEP}]
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	uv? ( dev-python/uv[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
