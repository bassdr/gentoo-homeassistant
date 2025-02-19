# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="dbapi test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/adbc-driver-postgresql/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	adbc-driver-manager
	importlib-resources>=1.3
	pandas; extra == 'dbapi'
	pandas; extra == 'test'
	polars; extra == 'test'
	pyarrow>=8.0.0; extra == 'dbapi'
	pyarrow>=8.0.0; extra == 'test'
	pytest; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/adbc-driver-manager[${PYTHON_USEDEP}]
	>=dev-python/importlib-resources-1.3[${PYTHON_USEDEP}]
	dbapi? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dbapi? ( >=dev-python/pyarrow-8.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/polars[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-8.0.0[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
