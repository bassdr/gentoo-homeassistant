# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="documentation"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-kwparametrize/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black ; extra == 'testing'
	flake8 ; extra == 'testing'
	isort ; extra == 'testing'
	pallets-sphinx-themes ; extra == 'documentation'
	pygments-pytest ; extra == 'documentation'
	pylint ; extra == 'testing'
	pytest (>=6)
	sphinx ; extra == 'documentation'
	typing-extensions ; python_version < "3.8"
"
GENERATED_RDEPEND="${RDEPEND}
	documentation? ( dev-python/pallets-sphinx-themes[${PYTHON_USEDEP}] )
	documentation? ( dev-python/pygments-pytest[${PYTHON_USEDEP}] )
	>=dev-python/pytest-6[${PYTHON_USEDEP}]
	documentation? ( dev-python/sphinx[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
