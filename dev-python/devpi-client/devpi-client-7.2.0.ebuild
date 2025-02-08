# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/devpi-client/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build>=0.7.0
	check-manifest>=0.28
	colorama; platform_system == "Windows"
	devpi-common<5,>=4dev
	iniconfig
	pkginfo>=1.10.0
	platformdirs
	pluggy<2.0,>=0.6.0
	tomli; python_version < "3.11"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/build-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/check-manifest-0.28[${PYTHON_USEDEP}]
	>=dev-python/devpi-common-4_pre[${PYTHON_USEDEP}] <dev-python/devpi-common-5[${PYTHON_USEDEP}]
	dev-python/iniconfig[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.10.0[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	>=dev-python/pluggy-0.6.0[${PYTHON_USEDEP}] <dev-python/pluggy-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
