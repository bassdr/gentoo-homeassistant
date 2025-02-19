# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.0.28.post3)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-0.0.28.post3"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xformers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy
	torch==2.5.1
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	~dev-python/torch-2.5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

