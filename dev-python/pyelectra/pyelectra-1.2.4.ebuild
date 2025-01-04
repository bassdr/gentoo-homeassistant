# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_PN="pyElectra"
inherit distutils-r1
SRC_URI="https://github.com/jafar-atili/${PYPI_PN}/archive/refs/tags/${PV}.tar.gz -> ${PYPI_PN}-${PV}.gh.tar.gz"
S="${WORKDIR}/${PYPI_PN}-${PV}"

DESCRIPTION="Electra Smart Python Integration."
HOMEPAGE="
  https://pypi.org/project/pyElectra/
  homepage, https://pypi.org/project/pyelectra/
  repository, https://github.com/jafar-atili/pyelectra/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
