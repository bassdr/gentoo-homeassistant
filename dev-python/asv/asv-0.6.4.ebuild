# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc hg plugs test virtualenv"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/asv/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	asv-bench-memray; extra == 'plugs'
	asv-runner>=v0.2.1
	build
	colorama; platform_system == 'Windows'
	feedparser; extra == 'test'
	filelock; extra == 'test'
	flaky; extra == 'test'
	isort>=5.11.5; extra == 'dev'
	json5
	numpy; extra == 'test'
	packaging; extra == 'virtualenv'
	pympler; platform_python_implementation != 'PyPy'
	pytest-rerunfailures; extra == 'test'
	pytest-rerunfailures>=10.0; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest-xdist; extra == 'test'
	pytest; extra == 'test'
	python-hglib; extra == 'hg'
	python-hglib; platform_system != 'Windows' and extra == 'test'
	pyyaml; platform_python_implementation != 'PyPy'
	rpy2; (platform_system != 'Windows' and platform_python_implementation != 'PyPy') and extra == 'test'
	ruff; extra == 'dev'
	scipy; platform_python_implementation != 'PyPy' and extra == 'test'
	selenium; extra == 'test'
	sphinx-bootstrap-theme; extra == 'doc'
	sphinx; extra == 'doc'
	tabulate
	tomli; python_version < '3.11'
	virtualenv
	virtualenv; extra == 'test'
	virtualenv; extra == 'virtualenv'
"
GENERATED_RDEPEND="${RDEPEND}
	plugs? ( dev-python/asv-bench-memray[${PYTHON_USEDEP}] )
	>=dev-python/asv-runner-0.2.1[${PYTHON_USEDEP}]
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/json5[${PYTHON_USEDEP}]
	virtualenv? ( dev-python/packaging[${PYTHON_USEDEP}] )
	dev-python/pympler[${PYTHON_USEDEP}]
	hg? ( dev-python/python-hglib[${PYTHON_USEDEP}] )
	dev-python/pyyaml[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-bootstrap-theme[${PYTHON_USEDEP}] )
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
	virtualenv? ( dev-python/virtualenv[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		>=dev-python/isort-5.11.5[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-rerunfailures-10.0[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/python-hglib[${PYTHON_USEDEP}]
		dev-python/rpy2[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/selenium[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
