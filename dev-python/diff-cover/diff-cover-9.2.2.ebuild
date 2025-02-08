# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="toml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/diff-cover/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2>=2.7.1
	Pygments<3.0.0,>=2.9.0
	chardet>=3.0.0
	pluggy<2,>=0.13.1
	setuptools>=17.0.0; python_version < "3.8"
	tomli>=1.2.1; extra == "toml"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/chardet-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/pluggy-0.13.1[${PYTHON_USEDEP}] <dev-python/pluggy-2[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.9.0[${PYTHON_USEDEP}] <dev-python/pygments-3.0.0[${PYTHON_USEDEP}]
	toml? ( >=dev-python/tomli-1.2.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
