# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="check test type"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/multivolumefile/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	check-manifest ; extra == 'check'
	coverage[toml] (>=5.2) ; extra == 'test'
	coveralls (>=2.1.1) ; extra == 'test'
	flake8 ; extra == 'check'
	flake8-black ; extra == 'check'
	hypothesis ; extra == 'test'
	isort (>=5.0.3) ; extra == 'check'
	mypy ; extra == 'type'
	mypy-extensions ; extra == 'type'
	pyannotate ; extra == 'test'
	pygments ; extra == 'check'
	pytest ; extra == 'test'
	pytest-cov ; extra == 'test'
	readme-renderer ; extra == 'check'
	twine ; extra == 'check'
"
GENERATED_RDEPEND="${RDEPEND}
	check? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8[${PYTHON_USEDEP}] )
	check? ( dev-python/flake8-black[${PYTHON_USEDEP}] )
	check? ( >=dev-python/isort-5.0.3[${PYTHON_USEDEP}] )
	type? ( dev-python/mypy[${PYTHON_USEDEP}] )
	type? ( dev-python/mypy-extensions[${PYTHON_USEDEP}] )
	check? ( dev-python/pygments[${PYTHON_USEDEP}] )
	check? ( dev-python/readme-renderer[${PYTHON_USEDEP}] )
	check? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/coverage-5.2[toml,${PYTHON_USEDEP}]
		>=dev-python/coveralls-2.1.1[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pyannotate[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
