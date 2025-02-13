# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 1.0.0a4)"
S="${WORKDIR}/${PN}-1.0.0a4"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aetcd/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/grpcio-2[${PYTHON_USEDEP}]
	<dev-python/protobuf-5[${PYTHON_USEDEP}]
	doc? ( ~dev-python/sphinx-6.1.3[${PYTHON_USEDEP}] )
	doc? ( ~dev-python/sphinx-rtd-theme-1.2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/flake8-6.0.0[${PYTHON_USEDEP}]
	~dev-python/flake8-commas-2.1.0[${PYTHON_USEDEP}]
	~dev-python/flake8-docstrings-1.7.0[${PYTHON_USEDEP}]
	~dev-python/flake8-isort-6.0.0[${PYTHON_USEDEP}]
	~dev-python/flake8-quotes-3.3.2[${PYTHON_USEDEP}]
	~dev-python/grpcio-tools-1.51.1[${PYTHON_USEDEP}]
	~dev-python/pep8-naming-0.13.3[${PYTHON_USEDEP}]
	~dev-python/pytest-7.2.1[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.20.3[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
	~dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}]
	~dev-python/twine-4.0.2[${PYTHON_USEDEP}]
)"
