# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pep257"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/hacking/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
	pep257? ( ~dev-python/flake8-docstrings-1.7.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	!=dev-python/coverage-4.4[${PYTHON_USEDEP}]
	>=dev-python/ddt-1.2.1[${PYTHON_USEDEP}]
	!=dev-python/eventlet-0.18.3[${PYTHON_USEDEP}]
	>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-subunit-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/stestr-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
	>=dev-python/testtools-2.2.0[${PYTHON_USEDEP}]
)"
