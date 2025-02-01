# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="build devel publish static-analysis"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/changelog-chug/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	build? ( dev-python/changelog-chug[devel,${PYTHON_USEDEP}] )
	devel? ( dev-python/changelog-chug[test,${PYTHON_USEDEP}] )
	publish? ( dev-python/changelog-chug[build,${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.21.0[${PYTHON_USEDEP}]
	devel? ( ~dev-python/isort-5.13[${PYTHON_USEDEP}] )
	static-analysis? ( ~dev-python/mccabe-0.7[${PYTHON_USEDEP}] )
	static-analysis? ( dev-python/pip-check[${PYTHON_USEDEP}] )
	static-analysis? ( ~dev-python/pycodestyle-2.12[${PYTHON_USEDEP}] )
	devel? ( ~dev-python/pyupgrade-3.17[${PYTHON_USEDEP}] )
	static-analysis? ( ~dev-python/ruff-0.6[${PYTHON_USEDEP}] )
	>=dev-python/semver-3.0.0[${PYTHON_USEDEP}]
	publish? ( dev-python/twine[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/changelog-chug[static-analysis,${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	>=dev-python/testscenarios-0.4[${PYTHON_USEDEP}]
	dev-python/testtools[${PYTHON_USEDEP}]
)"
