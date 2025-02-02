# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/dvc-s3/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiobotocore-2.5.0[boto3,${PYTHON_USEDEP}]
	dev-python/dvc[${PYTHON_USEDEP}]
	<dev-python/flatten-dict-1[${PYTHON_USEDEP}]
	>=dev-python/s3fs-2023.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/dvc[testing,${PYTHON_USEDEP}]
	dev-python/dvc-s3[tests,${PYTHON_USEDEP}]
	~dev-python/mypy-1.9.0[${PYTHON_USEDEP}]
	<dev-python/pytest-9[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-servers-0.4.0[s3,${PYTHON_USEDEP}]
	>=dev-python/pytest-xdist-3.2[${PYTHON_USEDEP}]
)"
