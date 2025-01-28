# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/datefinder/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( dev-python/mock[${PYTHON_USEDEP}] )
	test? ( dev-python/mock[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pylint-2.1.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-2.8.5[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-2.8.5[${PYTHON_USEDEP}] )
	>=dev-python/python-dateutil-2.4.2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev? ( >=dev-python/pytz-2015.7[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytz-2015.7[${PYTHON_USEDEP}] )
	>=dev-python/regex-2017.02.08[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest