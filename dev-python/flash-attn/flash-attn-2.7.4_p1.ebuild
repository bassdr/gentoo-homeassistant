# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 2.7.4.post1)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-2.7.4.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flash-attn/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	einops
	torch
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/einops[${PYTHON_USEDEP}]
	dev-python/torch[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
