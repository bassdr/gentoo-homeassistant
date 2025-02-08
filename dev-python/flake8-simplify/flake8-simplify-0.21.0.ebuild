# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flake8-simplify/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	astor>=0.1
	flake8>=3.7
	importlib-metadata>=0.9; python_version < "3.8"
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/astor-0.1[${PYTHON_USEDEP}]
	>=dev-python/flake8-3.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
