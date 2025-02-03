# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flake8-pyi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/flake8-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyflakes-2.1.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		=dev-python/black-24.8.0[${PYTHON_USEDEP}]
		=dev-python/flake8-bugbear-24.8.19[${PYTHON_USEDEP}]
		=dev-python/flake8-noqa-1.4.0[${PYTHON_USEDEP}]
		=dev-python/isort-5.13.2[${PYTHON_USEDEP}]
		=dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
		=dev-python/pre-commit-hooks-4.6.0[${PYTHON_USEDEP}]
		=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		=dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
		<dev-python/types-pyflakes-4[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
