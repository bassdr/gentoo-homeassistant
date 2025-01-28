# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all cli ods pandas xls xlsx yaml"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tablib/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	all? ( dev-python/odfpy[${PYTHON_USEDEP}] )
	ods? ( dev-python/odfpy[${PYTHON_USEDEP}] )
	all? ( >=dev-python/openpyxl-2.6.0[${PYTHON_USEDEP}] )
	xlsx? ( >=dev-python/openpyxl-2.6.0[${PYTHON_USEDEP}] )
	all? ( dev-python/pandas[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	all? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	yaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	all? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	cli? ( dev-python/tabulate[${PYTHON_USEDEP}] )
	all? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	xls? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	all? ( dev-python/xlwt[${PYTHON_USEDEP}] )
	xls? ( dev-python/xlwt[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest