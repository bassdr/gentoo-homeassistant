# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/infer-license/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/dataclasses-0.7[${PYTHON_USEDEP}]
	dev-python/importlib-resources[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/black-23.12.1[${PYTHON_USEDEP}]
	~dev-python/checkdeps-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/coverage-6[${PYTHON_USEDEP}]
	~dev-python/flake8-7.0.0[${PYTHON_USEDEP}]
	~dev-python/mypy-1.8.0[${PYTHON_USEDEP}]
	~dev-python/tox-4.12.1[${PYTHON_USEDEP}]
	~dev-python/twine-4.0.2[${PYTHON_USEDEP}]
	~dev-python/ufmt-2.3.0[${PYTHON_USEDEP}]
	~dev-python/usort-1.0.7[${PYTHON_USEDEP}]
	~dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
)"
