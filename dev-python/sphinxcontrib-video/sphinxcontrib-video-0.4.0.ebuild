# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="doc"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinxcontrib-video/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4; extra == 'test'
	defusedxml; extra == 'test'
	mypy; extra == 'dev'
	nox; extra == 'dev'
	pre-commit; extra == 'dev'
	pydata-sphinx-theme; extra == 'doc'
	pytest-cov; extra == 'test'
	pytest-regressions; extra == 'test'
	pytest; extra == 'test'
	sphinx
	sphinx-design; extra == 'doc'
"
GENERATED_RDEPEND="${RDEPEND}
	doc? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	dev-python/sphinx[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/nox[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
