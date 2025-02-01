# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/neptune-aws/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/neptune-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-5.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
