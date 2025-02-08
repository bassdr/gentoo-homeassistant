# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.6.7.post3)"
S="${WORKDIR}/${PN}-0.6.7.post3"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/osqp/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy>=1.7
	qdldl
	scipy!=1.12.0; extra == "dev"
	scipy>=0.13.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	dev-python/qdldl[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.13.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		!~dev-python/scipy-1.12.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
