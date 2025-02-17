# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="build devel publish static-analysis"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/changelog-chug/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build; extra == 'build'
	changelog-chug[build]; extra == 'publish'
	changelog-chug[devel]; extra == 'build'
	changelog-chug[static-analysis]; extra == 'test'
	changelog-chug[test]; extra == 'devel'
	coverage; extra == 'test'
	docutils>=0.21.0
	isort~=5.13; extra == 'devel'
	mccabe~=0.7; extra == 'static-analysis'
	pip-check; extra == 'static-analysis'
	pycodestyle~=2.12; extra == 'static-analysis'
	pyupgrade~=3.17; extra == 'devel'
	ruff~=0.6; extra == 'static-analysis'
	semver>=3.0.0
	testscenarios>=0.4; extra == 'test'
	testtools; extra == 'test'
	twine; extra == 'publish'
	wheel; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	build? ( dev-python/changelog-chug[devel,${PYTHON_USEDEP}] )
	devel? ( dev-python/changelog-chug[test,${PYTHON_USEDEP}] )
	publish? ( dev-python/changelog-chug[build,${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.21.0[${PYTHON_USEDEP}]
	devel? ( >=dev-python/isort-5.13[${PYTHON_USEDEP}] =dev-python/isort-5*[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/mccabe-0.7[${PYTHON_USEDEP}] =dev-python/mccabe-0*[${PYTHON_USEDEP}] )
	static-analysis? ( dev-python/pip-check[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/pycodestyle-2.12[${PYTHON_USEDEP}] =dev-python/pycodestyle-2*[${PYTHON_USEDEP}] )
	devel? ( >=dev-python/pyupgrade-3.17[${PYTHON_USEDEP}] =dev-python/pyupgrade-3*[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/ruff-0.6[${PYTHON_USEDEP}] =dev-python/ruff-0*[${PYTHON_USEDEP}] )
	>=dev-python/semver-3.0.0[${PYTHON_USEDEP}]
	publish? ( dev-python/twine[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/changelog-chug[static-analysis,${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
