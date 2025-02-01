# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="all azure gcs s3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scrapbook/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	all? ( dev-python/papermill[all,${PYTHON_USEDEP}] )
	azure? ( dev-python/papermill[azure,${PYTHON_USEDEP}] )
	dev-python/papermill[${PYTHON_USEDEP}]
	gcs? ( dev-python/papermill[gcs,${PYTHON_USEDEP}] )
	s3? ( dev-python/papermill[s3,${PYTHON_USEDEP}] )
	dev-python/pyarrow[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	dev-python/bumpversion[${PYTHON_USEDEP}]
	dev-python/bumpversion[${PYTHON_USEDEP}]
	dev-python/codecov[${PYTHON_USEDEP}]
	dev-python/codecov[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/papermill[dev,${PYTHON_USEDEP}]
	dev-python/papermill[dev,${PYTHON_USEDEP}]
	>=dev-python/pytest-4.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-4.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/pytest-env-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-env-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-1.10[${PYTHON_USEDEP}]
	>=dev-python/pytest-mock-1.10[${PYTHON_USEDEP}]
	>=dev-python/setuptools-38.6.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-38.6.0[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	>=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.31.0[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.31.0[${PYTHON_USEDEP}]
)"
