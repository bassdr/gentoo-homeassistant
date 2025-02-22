# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/beacontools/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+scan"  # Not doing anything with 'scan', only to satisfy dependency
REQUIRES_DIST="
	ahocorapy (==1.6.1)
	check-manifest ; extra == 'dev'
	check-manifest ; extra == 'test'
	construct (<2.11,>=2.9.52)
	coveralls (~=2.1) ; extra == 'test'
	docutils ; extra == 'test'
	mock (~=4.0) ; extra == 'test'
	pylint ; extra == 'test'
	pytest (~=6.0) ; extra == 'test'
	pytest-cov (~=2.10) ; extra == 'test'
	readme-renderer ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	~dev-python/ahocorapy-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/construct-2.9.52[${PYTHON_USEDEP}] <dev-python/construct-2.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/check-manifest[${PYTHON_USEDEP}]
		>=dev-python/coveralls-2.1[${PYTHON_USEDEP}] =dev-python/coveralls-2*[${PYTHON_USEDEP}]
		dev-python/docutils[${PYTHON_USEDEP}]
		>=dev-python/mock-4.0[${PYTHON_USEDEP}] =dev-python/mock-4*[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}] =dev-python/pytest-6*[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.10[${PYTHON_USEDEP}] =dev-python/pytest-cov-2*[${PYTHON_USEDEP}]
		dev-python/readme-renderer[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
