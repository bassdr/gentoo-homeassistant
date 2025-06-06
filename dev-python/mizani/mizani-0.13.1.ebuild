# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all doc lint rtd test typing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mizani/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build; extra == 'build'
	mizani[build]; extra == 'all'
	mizani[dev]; extra == 'all'
	mizani[doc]; extra == 'all'
	mizani[lint]; extra == 'all'
	mizani[test]; extra == 'all'
	mizani[typing]; extra == 'dev'
	mock; extra == 'rtd'
	notebook; extra == 'dev'
	numpy>=1.23.5
	numpydoc>=1.7.0; extra == 'doc'
	pandas-stubs; extra == 'typing'
	pandas>=2.2.0
	pre-commit; extra == 'dev'
	pyright==1.1.390; extra == 'typing'
	pytest-cov>=4.0.0; extra == 'test'
	ruff; extra == 'lint'
	scipy>=1.8.0
	sphinx>=7.2.0; extra == 'doc'
	twine; extra == 'dev'
	tzdata; platform_system == 'Windows' or platform_system == 'Emscripten'
	wheel; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/mizani[build,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[dev,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[doc,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[lint,${PYTHON_USEDEP}] )
	all? ( dev-python/mizani[test,${PYTHON_USEDEP}] )
	rtd? ( dev-python/mock[${PYTHON_USEDEP}] )
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
	doc? ( >=dev-python/numpydoc-1.7.0[${PYTHON_USEDEP}] )
	>=dev-python/pandas-2.2.0[${PYTHON_USEDEP}]
	typing? ( dev-python/pandas-stubs[${PYTHON_USEDEP}] )
	typing? ( ~dev-python/pyright-1.1.390[${PYTHON_USEDEP}] )
	lint? ( dev-python/ruff[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.8.0[${PYTHON_USEDEP}]
	doc? ( >=dev-python/sphinx-7.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/mizani[typing,${PYTHON_USEDEP}]
		dev-python/notebook[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
