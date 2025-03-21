# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs integration lint test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deal/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	astroid>=2.11.0; extra == 'all'
	astroid>=2.11.0; extra == 'integration'
	coverage-conditional-plugin; extra == 'test'
	coverage[toml]; extra == 'test'
	deal-solver>=0.1.2; extra == 'all'
	deal-solver>=0.1.2; extra == 'integration'
	deal-solver>=0.1.2; extra == 'lint'
	docstring-parser; extra == 'test'
	flake8-commas; extra == 'lint'
	flake8-quotes; extra == 'lint'
	flake8; extra == 'integration'
	flake8; extra == 'lint'
	hypothesis; extra == 'all'
	hypothesis; extra == 'integration'
	hypothesis; extra == 'lint'
	isort; extra == 'lint'
	m2r2>=0.3.3.post2; extra == 'docs'
	marshmallow; extra == 'integration'
	mypy>=0.900; extra == 'lint'
	mypy_test>=0.1.1; extra == 'lint'
	myst-parser; extra == 'docs'
	pygments; extra == 'all'
	pygments; extra == 'integration'
	pygments; extra == 'lint'
	pytest-cov; extra == 'test'
	pytest; extra == 'test'
	sphinx-rtd-theme==2.*; extra == 'docs'
	sphinx==7.*; extra == 'docs'
	sphinx>=4.5.0; extra == 'integration'
	typeguard<4.0.0; extra == 'integration'
	typeguard<4.0.0; extra == 'lint'
	typeguard>=3.0.0; extra == 'all'
	unify; extra == 'lint'
	urllib3; extra == 'test'
	vaa>=0.2.1; extra == 'all'
	vaa>=0.2.1; extra == 'integration'
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/astroid-2.11.0[${PYTHON_USEDEP}] )
	integration? ( >=dev-python/astroid-2.11.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/deal-solver-0.1.2[${PYTHON_USEDEP}] )
	integration? ( >=dev-python/deal-solver-0.1.2[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/deal-solver-0.1.2[${PYTHON_USEDEP}] )
	integration? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-commas[${PYTHON_USEDEP}] )
	lint? ( dev-python/flake8-quotes[${PYTHON_USEDEP}] )
	all? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	integration? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	lint? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	lint? ( dev-python/isort[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/m2r2-0.3.3_p2[${PYTHON_USEDEP}] )
	integration? ( dev-python/marshmallow[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-0.900[${PYTHON_USEDEP}] )
	lint? ( >=dev-python/mypy-test-0.1.1[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	all? ( dev-python/pygments[${PYTHON_USEDEP}] )
	integration? ( dev-python/pygments[${PYTHON_USEDEP}] )
	lint? ( dev-python/pygments[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-7*[${PYTHON_USEDEP}] )
	integration? ( >=dev-python/sphinx-4.5.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-rtd-theme-2*[${PYTHON_USEDEP}] )
	all? ( >=dev-python/typeguard-3.0.0[${PYTHON_USEDEP}] )
	integration? ( <dev-python/typeguard-4.0.0[${PYTHON_USEDEP}] )
	lint? ( <dev-python/typeguard-4.0.0[${PYTHON_USEDEP}] )
	lint? ( dev-python/unify[${PYTHON_USEDEP}] )
	all? ( >=dev-python/vaa-0.2.1[${PYTHON_USEDEP}] )
	integration? ( >=dev-python/vaa-0.2.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/coverage-conditional-plugin[${PYTHON_USEDEP}]
		dev-python/docstring-parser[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
