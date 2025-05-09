# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all calc s3 test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fiona/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiohttp; extra == 'test'
	attrs>=19.2.0
	boto3>=1.3.1; extra == 's3'
	certifi
	click-plugins>=1.0
	click~=8.0
	cligj>=0.5
	fiona[calc,s3,test]; extra == 'all'
	fiona[s3]; extra == 'test'
	fsspec; extra == 'test'
	importlib-metadata; python_version < '3.10'
	pyparsing; extra == 'calc'
	pytest-cov; extra == 'test'
	pytest>=7; extra == 'test'
	pytz; extra == 'test'
	shapely; extra == 'calc'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/attrs-19.2.0[${PYTHON_USEDEP}]
	s3? ( >=dev-python/boto3-1.3.1[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}] =dev-python/click-8*[${PYTHON_USEDEP}]
	>=dev-python/click-plugins-1.0[${PYTHON_USEDEP}]
	>=dev-python/cligj-0.5[${PYTHON_USEDEP}]
	all? ( dev-python/fiona[calc,s3,test,${PYTHON_USEDEP}] )
	calc? ( dev-python/pyparsing[${PYTHON_USEDEP}] )
	calc? ( dev-python/shapely[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/fiona[s3,${PYTHON_USEDEP}]
		dev-python/fsspec[${PYTHON_USEDEP}]
		>=dev-python/pytest-7[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
