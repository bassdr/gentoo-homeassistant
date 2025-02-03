# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="build cmd doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyct/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/nbsite[${PYTHON_USEDEP}] )
	>=dev-python/param-1.7.0[${PYTHON_USEDEP}]
	build? ( >=dev-python/param-1.7.0[${PYTHON_USEDEP}] )
	cmd? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	cmd? ( dev-python/requests[${PYTHON_USEDEP}] )
	build? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-ioam-theme[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
