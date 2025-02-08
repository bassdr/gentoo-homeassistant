# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pdoc/"

LICENSE="MIT-0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2>=2.11.0
	MarkupSafe>=1.1.1
	pygments>=2.12.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/jinja2-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
