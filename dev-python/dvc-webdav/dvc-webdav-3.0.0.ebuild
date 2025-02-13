# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-webdav/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/dvc[${PYTHON_USEDEP}]
	>=dev-python/webdav4-0.9.3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/cheroot-8.6.0[${PYTHON_USEDEP}]
	dev-python/dvc[testing,${PYTHON_USEDEP}]
	~dev-python/flaky-3.7.0[${PYTHON_USEDEP}]
	~dev-python/mypy-0.991[${PYTHON_USEDEP}]
	~dev-python/pylint-2.15.9[${PYTHON_USEDEP}]
	~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	~dev-python/pytest-lazy-fixture-0.6.3[${PYTHON_USEDEP}]
	~dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
	~dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}]
	~dev-python/wsgidav-3.1.1[${PYTHON_USEDEP}]
)"
