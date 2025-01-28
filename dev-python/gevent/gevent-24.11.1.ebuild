# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/gevent/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/coverage-5.0[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/greenlet-3.1.1[${PYTHON_USEDEP}]
	test? ( dev-python/objgraph[${PYTHON_USEDEP}] )
	>=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]
	docs? ( dev-python/repoze-sphinx-autointerface[${PYTHON_USEDEP}] )
	test? ( dev-python/requests[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-programoutput[${PYTHON_USEDEP}] )
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	docs? ( dev-python/zope-schema[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest