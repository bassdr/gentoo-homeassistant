# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
PYPI_PN="jaraco.tidelift"
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco-tidelift/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	autocommand
	flake8 (<5) ; extra == 'testing'
	furo ; extra == 'docs'
	importlib-resources (>=1.6)
	jaraco.packaging (>=9) ; extra == 'docs'
	keyring
	pytest (>=6) ; extra == 'testing'
	pytest-black (>=0.3.7) ; (platform_python_implementation != "PyPy") and extra == 'testing'
	pytest-checkdocs (>=2.4) ; extra == 'testing'
	pytest-cov ; extra == 'testing'
	pytest-enabler (>=1.3) ; extra == 'testing'
	pytest-flake8 ; (python_version < "3.12") and extra == 'testing'
	pytest-mypy (>=0.9.1) ; (platform_python_implementation != "PyPy") and extra == 'testing'
	requests-toolbelt
	rst.linker (>=1.9) ; extra == 'docs'
	sphinx (>=3.5) ; extra == 'docs'
	sphinx-lint ; extra == 'docs'
	types-docutils ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/autocommand[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	>=dev-python/importlib-resources-1.6[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9[${PYTHON_USEDEP}] )
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		<dev-python/flake8-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-1.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
		dev-python/types-docutils[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
