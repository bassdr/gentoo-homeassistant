# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-hdfs/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	dev-python/dvc[${PYTHON_USEDEP}]
	dev-python/fsspec[arrow,${PYTHON_USEDEP}]
	>=dev-python/pywin32-225[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/collective-checkdocs-0.2[${PYTHON_USEDEP}]
	~dev-python/crc32c-2.3[${PYTHON_USEDEP}]
	dev-python/dvc[testing,${PYTHON_USEDEP}]
	~dev-python/filelock-3.3.2[${PYTHON_USEDEP}]
	~dev-python/flaky-3.7.0[${PYTHON_USEDEP}]
	~dev-python/mock-4.0.3[${PYTHON_USEDEP}]
	~dev-python/mypy-0.981[${PYTHON_USEDEP}]
	~dev-python/pydocstyle-6.1.1[${PYTHON_USEDEP}]
	~dev-python/pygments-2.10.0[${PYTHON_USEDEP}]
	~dev-python/pylint-2.16.2[${PYTHON_USEDEP}]
	~dev-python/pylint-plugin-utils-0.6[${PYTHON_USEDEP}]
	~dev-python/pylint-pytest-1.1.2[${PYTHON_USEDEP}]
	~dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	<dev-python/pytest-docker-2[${PYTHON_USEDEP}]
	~dev-python/pytest-lazy-fixture-0.6.3[${PYTHON_USEDEP}]
	~dev-python/pytest-mock-3.6.1[${PYTHON_USEDEP}]
	~dev-python/pytest-xdist-2.4.0[${PYTHON_USEDEP}]
	~dev-python/types-requests-2.25.11[${PYTHON_USEDEP}]
	~dev-python/types-tabulate-0.8.3[${PYTHON_USEDEP}]
	~dev-python/types-toml-0.10.1[${PYTHON_USEDEP}]
	~dev-python/wget-3.2[${PYTHON_USEDEP}]
	~dev-python/wheel-0.37.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
)"
