# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev sphinx test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/testbook/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/black[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
	dev? ( dev-python/bumpversion[${PYTHON_USEDEP}] )
	test? ( dev-python/bumpversion[${PYTHON_USEDEP}] )
	dev? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	test? ( dev-python/check-manifest[${PYTHON_USEDEP}] )
	dev? ( dev-python/codecov[${PYTHON_USEDEP}] )
	test? ( dev-python/codecov[${PYTHON_USEDEP}] )
	dev? ( dev-python/coverage[${PYTHON_USEDEP}] )
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	dev? ( dev-python/flake8[${PYTHON_USEDEP}] )
	test? ( dev-python/flake8[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	test? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipython[${PYTHON_USEDEP}] )
	test? ( dev-python/ipython[${PYTHON_USEDEP}] )
	dev? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	test? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/myst-parser-0.9.1[${PYTHON_USEDEP}] )
	>=dev-python/nbclient-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.0.4[${PYTHON_USEDEP}]
	dev? ( dev-python/pandas[${PYTHON_USEDEP}] )
	test? ( dev-python/pandas[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pip-18.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pip-18.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-4.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-4.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/setuptools-38.6.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/setuptools-38.6.0[${PYTHON_USEDEP}] )
	sphinx? ( <dev-python/sphinx-3.0[${PYTHON_USEDEP}] )
	sphinx? ( ~dev-python/sphinx-book-theme-0.0.35[${PYTHON_USEDEP}] )
	dev? ( dev-python/tox[${PYTHON_USEDEP}] )
	test? ( dev-python/tox[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/twine-1.11.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/twine-1.11.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/wheel-0.31.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/wheel-0.31.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/xmltodict[${PYTHON_USEDEP}] )
	test? ( dev-python/xmltodict[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest