# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="check debug docs test test-compat"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/py7zr/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	check? ( >=dev-python/black-23.1.0[${PYTHON_USEDEP}] )
	>=dev-python/brotli-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/brotlicffi-1.1.0.0[${PYTHON_USEDEP}]
	check? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	test? ( >=dev-python/coverage-5.2[toml,${PYTHON_USEDEP}] )
	test? ( >=dev-python/coveralls-2.1.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	check? ( <dev-python/flake8-8[${PYTHON_USEDEP}] )
	check? ( >=dev-python/flake8-black-0.3.6[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-deprecated[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-isort[${PYTHON_USEDEP}] )
	<dev-python/inflate64-1.1.0[${PYTHON_USEDEP}]
	check? ( >=dev-python/isort-5.0.3[${PYTHON_USEDEP}] )
	test-compat? ( dev-python/libarchive-c[${PYTHON_USEDEP}] )
	check? ( dev-python/lxml[${PYTHON_USEDEP}] )
	>=dev-python/multivolumefile-0.2.3[${PYTHON_USEDEP}]
	check? ( >=dev-python/mypy-0.940[${PYTHON_USEDEP}] )
	check? ( >=dev-python/mypy-extensions-0.4.1[${PYTHON_USEDEP}] )
	dev-python/psutil[${PYTHON_USEDEP}]
	test? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
	<dev-python/pybcj-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.16.0[${PYTHON_USEDEP}]
	check? ( dev-python/pygments[${PYTHON_USEDEP}] )
	<dev-python/pyppmd-1.2.0[${PYTHON_USEDEP}]
	debug? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	debug? ( dev-python/pytest-leaks[${PYTHON_USEDEP}] )
	debug? ( dev-python/pytest-profiling[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-remotedata[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	>=dev-python/pyzstd-0.15.9[${PYTHON_USEDEP}]
	check? ( dev-python/readme-renderer[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-a4doc[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-py3doc-enhanced-theme[${PYTHON_USEDEP}] )
	dev-python/texttable[${PYTHON_USEDEP}]
	check? ( dev-python/twine[${PYTHON_USEDEP}] )
	check? ( dev-python/types-psutil[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest