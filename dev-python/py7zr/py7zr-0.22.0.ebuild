# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="check debug docs test test-compat"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/py7zr/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black>=23.1.0; extra == 'check'
	brotli>=1.1.0; platform_python_implementation == 'CPython'
	brotlicffi>=1.1.0.0; platform_python_implementation == 'PyPy'
	check-manifest; extra == 'check'
	coverage[toml]>=5.2; extra == 'test'
	coveralls>=2.1.1; extra == 'test'
	docutils; extra == 'docs'
	flake8-black>=0.3.6; extra == 'check'
	flake8-deprecated; extra == 'check'
	flake8-isort; extra == 'check'
	flake8<8; extra == 'check'
	inflate64<1.1.0,>=1.0.0
	isort>=5.0.3; extra == 'check'
	libarchive-c; extra == 'test-compat'
	lxml; extra == 'check'
	multivolumefile>=0.2.3
	mypy-extensions>=0.4.1; extra == 'check'
	mypy>=0.940; extra == 'check'
	psutil; sys_platform != 'cygwin'
	py-cpuinfo; extra == 'test'
	pybcj<1.1.0,>=1.0.0
	pycryptodomex>=3.16.0
	pygments; extra == 'check'
	pyppmd<1.2.0,>=1.1.0
	pytest-benchmark; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-leaks; extra == 'debug'
	pytest-profiling; extra == 'debug'
	pytest-remotedata; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest; extra == 'debug'
	pytest; extra == 'test'
	pyzstd>=0.15.9
	readme-renderer; extra == 'check'
	sphinx-a4doc; extra == 'docs'
	sphinx-py3doc-enhanced-theme; extra == 'docs'
	sphinx>=5.0; extra == 'docs'
	texttable
	twine; extra == 'check'
	types-psutil; extra == 'check'
"
GENERATED_RDEPEND="${RDEPEND}
	>=app-arch/brotli-1.1.0[python,${PYTHON_USEDEP}]
	check? ( >=dev-python/black-23.1.0[${PYTHON_USEDEP}] )
	check? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	check? ( <dev-python/flake8-8[${PYTHON_USEDEP}] )
	check? ( >=dev-python/flake8-black-0.3.6[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-deprecated[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-isort[${PYTHON_USEDEP}] )
	>=dev-python/inflate64-1.0.0[${PYTHON_USEDEP}] <dev-python/inflate64-1.1.0[${PYTHON_USEDEP}]
	check? ( >=dev-python/isort-5.0.3[${PYTHON_USEDEP}] )
	test-compat? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	check? ( dev-python/lxml[${PYTHON_USEDEP}] )
	>=dev-python/multivolumefile-0.2.3[${PYTHON_USEDEP}]
	check? ( >=dev-python/mypy-0.940[${PYTHON_USEDEP}] )
	check? ( >=dev-python/mypy-extensions-0.4.1[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pybcj-1.0.0[${PYTHON_USEDEP}] <dev-python/pybcj-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.16.0[${PYTHON_USEDEP}]
	check? ( dev-python/pygments[${PYTHON_USEDEP}] )
	>=dev-python/pyppmd-1.1.0[${PYTHON_USEDEP}] <dev-python/pyppmd-1.2.0[${PYTHON_USEDEP}]
	debug? ( dev-python/pytest[${PYTHON_USEDEP}] )
	debug? ( dev-python/pytest-leaks[${PYTHON_USEDEP}] )
	debug? ( dev-python/pytest-profiling[${PYTHON_USEDEP}] )
	>=dev-python/pyzstd-0.15.9[${PYTHON_USEDEP}]
	check? ( dev-python/readme-renderer[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-a4doc[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-py3doc-enhanced-theme[${PYTHON_USEDEP}] )
	dev-python/texttable[${PYTHON_USEDEP}]
	check? ( dev-python/twine[${PYTHON_USEDEP}] )
	check? ( dev-python/types-psutil[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-5.2[toml,${PYTHON_USEDEP}]
		>=dev-python/coveralls-2.1.1[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-remotedata[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
