# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs testing"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aboutcode-toolkit/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/attrs[${PYTHON_USEDEP}]
	testing? ( dev-python/black[${PYTHON_USEDEP}] )
	>=dev-python/boolean-py-3.5[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	docs? ( >=dev-python/doc8-0.11.2[${PYTHON_USEDEP}] )
	testing? ( dev-python/isort[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/license-expression-0.94[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	>=dev-python/packageurl-python-0.9.0[${PYTHON_USEDEP}]
	testing? ( !=dev-python/pytest-7.0.0[${PYTHON_USEDEP}] )
	testing? ( >=dev-python/pytest-xdist-2[${PYTHON_USEDEP}] )
	dev-python/saneyaml[${PYTHON_USEDEP}]
	docs? ( >=dev-python/sphinx-5.0.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-reredirects-0.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.0.0[${PYTHON_USEDEP}] )
	testing? ( dev-python/twine[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
