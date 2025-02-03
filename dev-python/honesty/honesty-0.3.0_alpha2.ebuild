# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.3.0a2)"
S="${WORKDIR}/${PN}-0.3.0a2"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/honesty/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.6[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/dataclasses-0.7[${PYTHON_USEDEP}]
	>=dev-python/infer-license-0.0.6[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.3[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
