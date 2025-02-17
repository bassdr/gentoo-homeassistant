# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tbparse/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flake8; extra == 'testing'
	mypy; extra == 'testing'
	nbsphinx; extra == 'testing'
	pandas>=1.3.0
	pylint; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest; extra == 'testing'
	seaborn; extra == 'testing'
	soundfile; extra == 'testing'
	sphinx-rtd-theme; extra == 'testing'
	sphinx-tabs; extra == 'testing'
	sphinx; extra == 'testing'
	tensorboard>=2.12.0
	tensorboardX==2.6; extra == 'testing'
	torch; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/tensorboard-2.12.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/nbsphinx[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
		dev-python/sphinx-tabs[${PYTHON_USEDEP}]
		~dev-python/tensorboardx-2.6[${PYTHON_USEDEP}]
		dev-python/torch[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
