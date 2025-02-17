# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/crosshair-tool/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autodocsumm<1,>=0.2.2; extra == 'dev'
	black==22.3.0; extra == 'dev'
	deal>=4.13.0; extra == 'dev'
	icontract>=2.4.0; extra == 'dev'
	importlib_metadata>=4.0.0
	isort==5.11.5; extra == 'dev'
	mypy==0.990; extra == 'dev'
	numpy==1.23.4; python_version < '3.12' and extra == 'dev'
	numpy==1.26.0; (python_version >= '3.12' and python_version < '3.13') and extra == 'dev'
	numpy==2.0.1; python_version >= '3.13' and extra == 'dev'
	packaging
	pre-commit~=2.20; extra == 'dev'
	pygls>=1.0.0
	pytest-xdist; extra == 'dev'
	pytest; extra == 'dev'
	setuptools; extra == 'dev'
	sphinx-rtd-theme>=0.5.1; extra == 'dev'
	sphinx>=3.4.3; extra == 'dev'
	typeshed-client>=2.0.5
	typing-inspect>=0.7.1
	typing_extensions>=3.10.0
	wheel; extra == 'dev'
	z3-solver>=4.13.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/importlib-metadata-4.0.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pygls-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/typeshed-client-2.0.5[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/z3-solver-4.13.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/autodocsumm-0.2.2[${PYTHON_USEDEP}] <dev-python/autodocsumm-1[${PYTHON_USEDEP}]
		~dev-python/black-22.3.0[${PYTHON_USEDEP}]
		>=dev-python/deal-4.13.0[${PYTHON_USEDEP}]
		>=dev-python/icontract-2.4.0[${PYTHON_USEDEP}]
		~dev-python/isort-5.11.5[${PYTHON_USEDEP}]
		~dev-python/mypy-0.990[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '~dev-python/numpy-1.26.0[${PYTHON_USEDEP}]' python3_12)
		$(python_gen_cond_dep '~dev-python/numpy-2.0.1[${PYTHON_USEDEP}]' python3_13{,t})
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/sphinx-3.4.3[${PYTHON_USEDEP}]
		>=dev-python/sphinx-rtd-theme-0.5.1[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.20[${PYTHON_USEDEP}] =dev-vcs/pre-commit-2*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
