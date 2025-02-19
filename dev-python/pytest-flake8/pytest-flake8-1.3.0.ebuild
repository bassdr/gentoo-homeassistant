# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="check cover doc enabler test type"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-flake8/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	flake8>=4.0
	furo; extra == 'doc'
	jaraco.packaging>=9.3; extra == 'doc'
	pytest!=8.1.*,>=6; extra == 'test'
	pytest-checkdocs>=2.4; extra == 'check'
	pytest-cov; extra == 'cover'
	pytest-enabler>=2.2; extra == 'enabler'
	pytest-mypy; extra == 'type'
	pytest-ruff>=0.2.1; sys_platform != 'cygwin' and extra == 'check'
	pytest>=7.0
	rst.linker>=1.9; extra == 'doc'
	sphinx-lint; extra == 'doc'
	sphinx>=3.5; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/flake8-4.0[${PYTHON_USEDEP}]
	doc? ( dev-python/furo[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}] )
	>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
	check? ( >=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}] )
	cover? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	enabler? ( >=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}] )
	type? ( dev-python/pytest-mypy[${PYTHON_USEDEP}] )
	check? ( >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/rst-linker-1.9[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-3.5[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-lint[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}] !=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
