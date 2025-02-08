# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION="Python-ASN1 is a simple ASN.1 encoder and decoder for Python 2.7+ and 3.5+."
HOMEPAGE="
  https://pypi.org/project/asn1/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	enum-compat
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/enum-compat[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

EPYTEST_XDIST=1
distutils_enable_tests pytest
