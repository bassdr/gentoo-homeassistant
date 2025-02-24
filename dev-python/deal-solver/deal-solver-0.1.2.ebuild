# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deal-solver/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	astroid
	flake8 ; extra == 'lint'
	flake8-bugbear ; extra == 'lint'
	flake8-commas ; extra == 'lint'
	flake8-quotes ; extra == 'lint'
	hypothesis ; extra == 'test'
	isort ; extra == 'lint'
	mypy>=0.910 ; extra == 'lint'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	pytest-xdist ; extra == 'test'
	unify ; extra == 'lint'
	z3-solver
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/astroid[${PYTHON_USEDEP}]
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-bugbear[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-commas[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-quotes[${PYTHON_USEDEP}] )
	lint? ( dev-python/isort[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-0.910[${PYTHON_USEDEP}] )
	lint? ( dev-python/unify[${PYTHON_USEDEP}] )
	dev-python/z3-solver[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
