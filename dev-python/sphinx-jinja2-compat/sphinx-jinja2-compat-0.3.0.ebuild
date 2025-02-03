# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-jinja2-compat/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jinja2-2.10[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
