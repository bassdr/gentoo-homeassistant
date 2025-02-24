# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="mypy"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/trio-typing/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	async-generator
	importlib-metadata
	mypy (>=1.0) ; extra == 'mypy'
	mypy-extensions (>=0.4.2)
	packaging
	trio (>=0.16.0)
	typing-extensions (>=3.7.4)
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/async-generator[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	mypy? ( >=dev-python/mypy-1.0[${PYTHON_USEDEP}] )
	>=dev-python/mypy-extensions-0.4.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/trio-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

