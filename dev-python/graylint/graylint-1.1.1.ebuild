# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="color release"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/graylint/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	release? ( ~dev-python/darkgray-dev-tools-0.0.2[${PYTHON_USEDEP}] )
	~dev-python/darkgraylib-1.2.0[${PYTHON_USEDEP}]
	color? ( >=dev-python/pygments-2.4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	>=dev-python/airium-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.3.2[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/mypy-0.990[${PYTHON_USEDEP}]
	dev-python/pathspec[${PYTHON_USEDEP}]
	dev-python/pip-requirements-parser[${PYTHON_USEDEP}]
	dev-python/pydocstyle[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.4.0[${PYTHON_USEDEP}]
	dev-python/pylint[${PYTHON_USEDEP}]
	>=dev-python/pytest-6.2.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-kwparametrize-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/requests-cache-0.7[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.21[${PYTHON_USEDEP}]
	>=dev-python/ruff-0.0.292[${PYTHON_USEDEP}]
	>=dev-python/twine-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/types-requests-2.27.9[${PYTHON_USEDEP}]
	>=dev-python/types-toml-0.10.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.9[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.21.0[${PYTHON_USEDEP}]
)"
