# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/czifile/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	imagecodecs (>=2019.5.22) ; platform_system == 'Windows'
	numpy (>=1.11.3)
	tifffile (>=2019.7.2)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.11.3[${PYTHON_USEDEP}]
	>=dev-python/tifffile-2019.7.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
