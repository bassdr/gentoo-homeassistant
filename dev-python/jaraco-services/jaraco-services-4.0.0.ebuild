# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jaraco-services/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	furo; extra == 'docs'
	jaraco.classes
	jaraco.packaging>=9.3; extra == 'docs'
	path
	portend
	pytest!=8.1.*,>=6; extra == 'testing'
	pytest-checkdocs>=2.4; extra == 'testing'
	pytest-cov; extra == 'testing'
	pytest-enabler>=2.2; extra == 'testing'
	pytest-mypy; extra == 'testing'
	pytest-ruff>=0.2.1; extra == 'testing'
	rst.linker>=1.9; extra == 'docs'
	sphinx-lint; extra == 'docs'
	sphinx>=3.5; extra == 'docs'
	tempora
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	dev-python/jaraco-classes[${PYTHON_USEDEP}]
	docs? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	dev-python/path[${PYTHON_USEDEP}]
	dev-python/portend[${PYTHON_USEDEP}]
	docs? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
	dev-python/tempora[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-mypy[${PYTHON_USEDEP}]
		>=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
