# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="colorama jupyter uvloop"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyink/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black==24.10.0
	click>=8.0.0
	colorama>=0.4.3; extra == 'colorama'
	ipython>=7.8.0; extra == 'jupyter'
	mypy-extensions>=0.4.3
	packaging>=22.0
	pathspec>=0.9.0
	platformdirs>=2
	tokenize-rt>=3.2.0; extra == 'jupyter'
	tomli>=1.1.0; python_version < '3.11'
	typing-extensions>=4.0.1; python_version < '3.11'
	uvloop>=0.15.2; extra == 'uvloop'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/black-24.10.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	colorama? ( >=dev-python/colorama-0.4.3[${PYTHON_USEDEP}] )
	jupyter? ( >=dev-python/ipython-7.8.0[${PYTHON_USEDEP}] )
	>=dev-python/mypy-extensions-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2[${PYTHON_USEDEP}]
	jupyter? ( >=dev-python/tokenize-rt-3.2.0[${PYTHON_USEDEP}] )
	uvloop? ( >=dev-python/uvloop-0.15.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
