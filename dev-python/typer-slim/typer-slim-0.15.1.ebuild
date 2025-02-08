# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="standard"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/typer-slim/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click>=8.0.0
	rich>=10.11.0; extra == "standard"
	shellingham>=1.3.0; extra == "standard"
	typing-extensions>=3.7.4.3
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	standard? ( >=dev-python/rich-10.11.0[${PYTHON_USEDEP}] )
	standard? ( >=dev-python/shellingham-1.3.0[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
