# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="benchmark docs lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/memray/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Cython; extra == 'dev'
	Cython; extra == 'test'
	IPython; extra == 'dev'
	IPython; extra == 'docs'
	asv; extra == 'benchmark'
	asv; extra == 'dev'
	black; extra == 'dev'
	black; extra == 'lint'
	bump2version; extra == 'dev'
	bump2version; extra == 'docs'
	check-manifest; extra == 'dev'
	check-manifest; extra == 'lint'
	flake8; extra == 'dev'
	flake8; extra == 'lint'
	furo; extra == 'dev'
	furo; extra == 'docs'
	greenlet; python_version < '3.14' and extra == 'dev'
	greenlet; python_version < '3.14' and extra == 'test'
	ipython; extra == 'dev'
	ipython; extra == 'test'
	isort; extra == 'dev'
	isort; extra == 'lint'
	jinja2>=2.9
	mypy; extra == 'dev'
	mypy; extra == 'lint'
	packaging; extra == 'dev'
	packaging; extra == 'test'
	pytest-cov; extra == 'dev'
	pytest-cov; extra == 'test'
	pytest-textual-snapshot; extra == 'dev'
	pytest-textual-snapshot; extra == 'test'
	pytest; extra == 'dev'
	pytest; extra == 'test'
	rich>=11.2.0
	setuptools; python_version >= '3.12' and extra == 'dev'
	setuptools; python_version >= '3.12' and extra == 'test'
	sphinx-argparse; extra == 'dev'
	sphinx-argparse; extra == 'docs'
	sphinx; extra == 'dev'
	sphinx; extra == 'docs'
	textual!=0.65.2,!=0.66,>=0.43; extra == 'dev'
	textual!=0.65.2,!=0.66,>=0.43; extra == 'test'
	textual>=0.41.0
	towncrier; extra == 'dev'
	towncrier; extra == 'docs'
	typing_extensions; python_version < '3.8.0'
"
GENERATED_RDEPEND="${RDEPEND}
	benchmark? ( dev-python/asv[${PYTHON_USEDEP}] )
	lint? ( dev-python/black[${PYTHON_USEDEP}] )
	docs? ( dev-python/bump2version[${PYTHON_USEDEP}] )
	lint? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/ipython[${PYTHON_USEDEP}] )
	lint? ( dev-python/isort[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.9[${PYTHON_USEDEP}]
	lint? ( dev-python/mypy[${PYTHON_USEDEP}] )
	>=dev-python/rich-11.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-argparse[${PYTHON_USEDEP}] )
	>=dev-python/textual-0.41.0[${PYTHON_USEDEP}]
	docs? ( dev-python/towncrier[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/asv[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/bump2version[${PYTHON_USEDEP}]
		dev-python/check-manifest[${PYTHON_USEDEP}]
		dev-python/cython[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/furo[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-textual-snapshot[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-argparse[${PYTHON_USEDEP}]
		>=dev-python/textual-0.43[${PYTHON_USEDEP}] !~dev-python/textual-0.65.2[${PYTHON_USEDEP}] !~dev-python/textual-0.66[${PYTHON_USEDEP}]
		dev-python/towncrier[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
