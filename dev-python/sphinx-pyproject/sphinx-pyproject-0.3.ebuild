# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.3.0)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-0.3.0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-pyproject/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	dom-toml>=0.3.0
	domdf-python-tools>=2.7.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/dom-toml-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/domdf-python-tools-2.7.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
