# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/coveralls/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	coverage[toml]!=6.0.*,!=6.1,!=6.1.1,<8.0,>=5.0
	docopt<0.7.0,>=0.6.1
	pyyaml<7.0,>=3.10; extra == 'yaml'
	requests<3.0.0,>=1.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/coverage-5.0[toml,${PYTHON_USEDEP}] <dev-python/coverage-8.0[toml,${PYTHON_USEDEP}] !=dev-python/coverage-6.0*[toml,${PYTHON_USEDEP}] !~dev-python/coverage-6.1[toml,${PYTHON_USEDEP}] !~dev-python/coverage-6.1.1[toml,${PYTHON_USEDEP}]
	>=dev-python/docopt-0.6.1[${PYTHON_USEDEP}] <dev-python/docopt-0.7.0[${PYTHON_USEDEP}]
	yaml? ( >=dev-python/pyyaml-3.10[${PYTHON_USEDEP}] <dev-python/pyyaml-7.0[${PYTHON_USEDEP}] )
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
