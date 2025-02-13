# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
IUSE=""

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "deepspeed-kernels" "0.0.1.dev1698255861")"
S="${WORKDIR}/deepspeed-kernels-0.0.1.dev1698255861"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deepspeed-kernels/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/cmake-3.24[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
