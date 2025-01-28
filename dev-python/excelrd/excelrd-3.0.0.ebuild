# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/excelrd/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( >=dev-python/pytest-6.0.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-6.0.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-md-report-0.3[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-md-report-0.3[${PYTHON_USEDEP}] )
	dev? ( <dev-python/releasecmd-1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.2.2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest