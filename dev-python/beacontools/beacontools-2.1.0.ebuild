# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/beacontools/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	~dev-python/ahocorapy-1.6.1[${PYTHON_USEDEP}]
	<dev-python/construct-2.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/check-manifest[${PYTHON_USEDEP}]
	~dev-python/coveralls-2.1[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	~dev-python/mock-4.0[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	~dev-python/pytest-6.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-2.10[${PYTHON_USEDEP}]
	dev-python/readme-renderer[${PYTHON_USEDEP}]
)"
