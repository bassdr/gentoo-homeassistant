# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev docs"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/attribution/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev? ( ~dev-python/black-24.2.0[${PYTHON_USEDEP}] )
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	dev? ( ~dev-python/coverage-7.4.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/flake8-7.0.0[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/flake8-bugbear-24.2.6[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/flit-3.9.0[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.7[${PYTHON_USEDEP}]
	dev? ( ~dev-python/mypy-1.8.0[${PYTHON_USEDEP}] )
	>=dev-python/packaging-16.2[${PYTHON_USEDEP}]
	dev? ( ~dev-python/pessimist-0.9.3[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/rich-13.7.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-mdinclude-0.5.3[${PYTHON_USEDEP}] )
	>=dev-python/tomlkit-0.7.0[${PYTHON_USEDEP}]
	dev? ( ~dev-python/ufmt-2.3.0[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/usort-1.0.7[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/wheel-0.42.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest