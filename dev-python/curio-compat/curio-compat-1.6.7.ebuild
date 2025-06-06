# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/curio-compat/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	Sphinx; extra == 'test'
	bump2version; extra == 'test'
	mypy; extra == 'test'
	pre-commit; extra == 'test'
	pytest; extra == 'test'
	ruff; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/bump2version[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
