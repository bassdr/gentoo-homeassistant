# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="full"
IUSE="${GENERATED_IUSE}"

PYPI_PN="redshift_connector"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/redshift-connector/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4<5.0.0,>=4.7.0
	boto3<2.0.0,>=1.9.201
	botocore<2.0.0,>=1.12.201
	lxml>=4.6.5
	numpy; extra == "full"
	packaging
	pandas; extra == "full"
	pytz>=2020.1
	requests<3.0.0,>=2.23.0
	scramp<1.5.0,>=1.2.0
	setuptools
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/beautifulsoup4-4.7.0[${PYTHON_USEDEP}] <dev-python/beautifulsoup4-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.9.201[${PYTHON_USEDEP}] <dev-python/boto3-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.12.201[${PYTHON_USEDEP}] <dev-python/botocore-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6.5[${PYTHON_USEDEP}]
	full? ( dev-python/numpy[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	full? ( dev-python/pandas[${PYTHON_USEDEP}] )
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/scramp-1.2.0[${PYTHON_USEDEP}] <dev-python/scramp-1.5.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
