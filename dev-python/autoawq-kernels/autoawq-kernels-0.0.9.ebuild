# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1
SRC_URI="https://github.com/casper-hansen/AutoAWQ_kernels/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tzr.gz"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/autoawq-kernels/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/torch-2.5.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
