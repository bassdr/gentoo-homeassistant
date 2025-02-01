# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "osqp" "0.6.7.post3")"
S="${WORKDIR}/osqp-0.6.7.post3"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/osqp/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	dev-python/qdldl[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.13.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	!=dev-python/scipy-1.12.0[${PYTHON_USEDEP}]
)"
