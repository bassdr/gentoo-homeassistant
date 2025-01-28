# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="logging test"
IUSE="${GENERATED_IUSE}"

PYPI_PN="DataProperty"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/DataProperty/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	logging? ( <dev-python/loguru-1[${PYTHON_USEDEP}] )
	<dev-python/mbstrdecoder-2[${PYTHON_USEDEP}]
	test? ( >=dev-python/pytest-6.0.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-md-report-0.6.2[${PYTHON_USEDEP}] )
	test? ( >=dev-python/tcolorpy-0.1.2[${PYTHON_USEDEP}] )
	<dev-python/typepy-2[datetime,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest