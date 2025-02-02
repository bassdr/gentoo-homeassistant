# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flake8-noqa/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/flake8-8.0[${PYTHON_USEDEP}]
	<dev-python/importlib-metadata-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/flake8-6.0.0[${PYTHON_USEDEP}]
	dev-python/flake8-annotations[${PYTHON_USEDEP}]
	dev-python/flake8-bandit[${PYTHON_USEDEP}]
	dev-python/flake8-bugbear[${PYTHON_USEDEP}]
	dev-python/flake8-commas[${PYTHON_USEDEP}]
	dev-python/flake8-comprehensions[${PYTHON_USEDEP}]
	dev-python/flake8-continuation[${PYTHON_USEDEP}]
	dev-python/flake8-datetimez[${PYTHON_USEDEP}]
	dev-python/flake8-docstrings[${PYTHON_USEDEP}]
	dev-python/flake8-import-order[${PYTHON_USEDEP}]
	dev-python/flake8-literal[${PYTHON_USEDEP}]
	dev-python/flake8-modern-annotations[${PYTHON_USEDEP}]
	dev-python/flake8-noqa[${PYTHON_USEDEP}]
	dev-python/flake8-polyfill[${PYTHON_USEDEP}]
	dev-python/flake8-pyproject[${PYTHON_USEDEP}]
	dev-python/flake8-requirements[${PYTHON_USEDEP}]
	dev-python/flake8-typechecking-import[${PYTHON_USEDEP}]
	dev-python/flake8-use-fstring[${PYTHON_USEDEP}]
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/pep8-naming[${PYTHON_USEDEP}]
)"
