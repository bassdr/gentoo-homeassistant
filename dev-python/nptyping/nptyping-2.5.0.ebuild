# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="complete pandas qa test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/nptyping/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autoflake ; extra == 'dev'
	autoflake ; extra == 'qa'
	beartype (<0.10.0) ; (python_version < '3.10') and extra == 'dev'
	beartype (<0.10.0) ; (python_version < '3.10') and extra == 'qa'
	beartype (>=0.10.0) ; (python_version >= '3.10') and extra == 'dev'
	beartype (>=0.10.0) ; (python_version >= '3.10') and extra == 'qa'
	black ; extra == 'dev'
	black ; extra == 'qa'
	codecov (>=2.1.0) ; extra == 'dev'
	codecov (>=2.1.0) ; extra == 'qa'
	coverage ; extra == 'dev'
	coverage ; extra == 'qa'
	feedparser ; extra == 'dev'
	feedparser ; extra == 'qa'
	invoke (>=1.6.0) ; extra == 'build'
	invoke (>=1.6.0) ; extra == 'dev'
	isort ; extra == 'dev'
	isort ; extra == 'qa'
	mypy ; extra == 'dev'
	mypy ; extra == 'qa'
	numpy (<2.0.0,>=1.20.0) ; python_version >= '3.8'
	numpy (==1.21.5) ; python_version < '3.8'
	pandas ; extra == 'complete'
	pandas ; extra == 'dev'
	pandas ; extra == 'pandas'
	pandas-stubs-fork ; (python_version >= '3.8') and extra == 'complete'
	pandas-stubs-fork ; (python_version >= '3.8') and extra == 'dev'
	pandas-stubs-fork ; (python_version >= '3.8') and extra == 'pandas'
	pip-tools (>=6.5.0) ; extra == 'build'
	pip-tools (>=6.5.0) ; extra == 'dev'
	pylint ; extra == 'dev'
	pylint ; extra == 'qa'
	pyright ; extra == 'dev'
	pyright ; extra == 'qa'
	setuptools ; extra == 'dev'
	setuptools ; extra == 'qa'
	typeguard ; extra == 'dev'
	typeguard ; extra == 'qa'
	typing-extensions (<5.0.0,>=4.0.0) ; python_version < '3.10'
	wheel ; extra == 'dev'
	wheel ; extra == 'qa'
"
GENERATED_RDEPEND="${RDEPEND}
	qa? ( dev-python/autoflake[${PYTHON_USEDEP}] )
	qa? ( >=dev-python/beartype-0.10.0[${PYTHON_USEDEP}] )
	qa? ( dev-python/black[${PYTHON_USEDEP}] )
	qa? ( >=dev-python/codecov-2.1.0[${PYTHON_USEDEP}] )
	qa? ( dev-python/coverage[${PYTHON_USEDEP}] )
	qa? ( dev-python/feedparser[${PYTHON_USEDEP}] )
	qa? ( dev-python/isort[${PYTHON_USEDEP}] )
	qa? ( dev-python/mypy[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}] <dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	complete? ( dev-python/pandas[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas[${PYTHON_USEDEP}] )
	complete? ( dev-python/pandas-stubs-fork[${PYTHON_USEDEP}] )
	pandas? ( dev-python/pandas-stubs-fork[${PYTHON_USEDEP}] )
	qa? ( dev-python/pylint[${PYTHON_USEDEP}] )
	qa? ( dev-python/pyright[${PYTHON_USEDEP}] )
	qa? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	qa? ( dev-python/typeguard[${PYTHON_USEDEP}] )
	qa? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	>=dev-python/invoke-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/pip-tools-6.5.0[${PYTHON_USEDEP}]
	test? (
		dev-python/autoflake[${PYTHON_USEDEP}]
		>=dev-python/beartype-0.10.0[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		>=dev-python/codecov-2.1.0[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pandas-stubs-fork[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pyright[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/typeguard[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
