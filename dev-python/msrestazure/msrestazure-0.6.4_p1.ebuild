# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

SRC_URI="$(pypi_sdist_url --no-normalize "msrestazure" "0.6.4.post1")"
S="${WORKDIR}/msrestazure-0.6.4.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/msrestazure/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	<dev-python/adal-2.0.0[${PYTHON_USEDEP}]
	<dev-python/msrest-2.0.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
