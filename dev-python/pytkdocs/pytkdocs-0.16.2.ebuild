# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="numpy-style"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytkdocs/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/astunparse-1.6[${PYTHON_USEDEP}]
	>=dev-python/cached-property-1.5[${PYTHON_USEDEP}]
	numpy-style? ( >=dev-python/docstring-parser-0.7[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-3.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
