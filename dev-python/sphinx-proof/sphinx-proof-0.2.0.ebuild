# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all code-style rtd"
IUSE="${GENERATED_IUSE}"

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-proof/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	beautifulsoup4; extra == "all"
	beautifulsoup4; extra == "testing"
	black; extra == "all"
	black; extra == "code-style"
	coverage; extra == "all"
	coverage; extra == "testing"
	defusedxml; extra == "all"
	defusedxml; extra == "testing"
	docutils>=0.15
	flake8; extra == "all"
	flake8; extra == "code-style"
	myst-parser; extra == "all"
	myst-parser; extra == "rtd"
	myst-parser; extra == "testing"
	pre-commit; extra == "all"
	pre-commit; extra == "code-style"
	pytest-cov; extra == "all"
	pytest-cov; extra == "testing"
	pytest-regressions; extra == "all"
	pytest-regressions; extra == "testing"
	pytest~=7.1; extra == "all"
	pytest~=7.1; extra == "testing"
	sphinx
	sphinx-book-theme
	sphinx-book-theme; extra == "all"
	sphinx-book-theme; extra == "rtd"
	sphinx-togglebutton; extra == "all"
	sphinx-togglebutton; extra == "rtd"
	sphinx>=5.0; extra == "all"
	sphinx>=5.0; extra == "rtd"
	sphinxcontrib-bibtex; extra == "all"
	sphinxcontrib-bibtex; extra == "rtd"
	texsoup; extra == "all"
	texsoup; extra == "testing"
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	all? ( dev-python/black[${PYTHON_USEDEP}] )
	code-style? ( dev-python/black[${PYTHON_USEDEP}] )
	all? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	>=dev-python/docutils-0.15[${PYTHON_USEDEP}]
	all? ( dev-python/flake8[${PYTHON_USEDEP}] )
	code-style? ( dev-python/flake8[${PYTHON_USEDEP}] )
	all? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	rtd? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-7.1[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	dev-python/sphinx[${PYTHON_USEDEP}]
	rtd? ( >=dev-python/sphinx-5.0[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	dev-python/sphinx-book-theme[${PYTHON_USEDEP}]
	rtd? ( dev-python/sphinx-book-theme[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinx-togglebutton[${PYTHON_USEDEP}] )
	all? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	rtd? ( dev-python/sphinxcontrib-bibtex[${PYTHON_USEDEP}] )
	all? ( dev-python/texsoup[${PYTHON_USEDEP}] )
	all? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	code-style? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/myst-parser[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}] =dev-python/pytest-7*[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		dev-python/texsoup[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
