# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="code-style rtd testing-no-myst theme-furo theme-im theme-pydata theme-rtd theme-sbt"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-design/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	defusedxml; extra == 'testing'
	defusedxml; extra == 'testing-no-myst'
	furo~=2024.7.18; extra == 'theme-furo'
	myst-parser<4,>=2; extra == 'rtd'
	myst-parser<4,>=2; extra == 'testing'
	pre-commit<4,>=3; extra == 'code-style'
	pydata-sphinx-theme~=0.15.2; extra == 'theme-pydata'
	pytest-cov; extra == 'testing'
	pytest-cov; extra == 'testing-no-myst'
	pytest-regressions; extra == 'testing'
	pytest-regressions; extra == 'testing-no-myst'
	pytest~=8.3; extra == 'testing'
	pytest~=8.3; extra == 'testing-no-myst'
	sphinx-book-theme~=1.1; extra == 'theme-sbt'
	sphinx-immaterial~=0.12.2; extra == 'theme-im'
	sphinx-rtd-theme~=2.0; extra == 'theme-rtd'
	sphinx<9,>=6
"
GENERATED_RDEPEND="${RDEPEND}
	testing-no-myst? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	theme-furo? ( >=dev-python/furo-2024.7.18[${PYTHON_USEDEP}] =dev-python/furo-2024.7*[${PYTHON_USEDEP}] )
	rtd? ( >=dev-python/myst-parser-2[${PYTHON_USEDEP}] <dev-python/myst-parser-4[${PYTHON_USEDEP}] )
	theme-pydata? ( >=dev-python/pydata-sphinx-theme-0.15.2[${PYTHON_USEDEP}] =dev-python/pydata-sphinx-theme-0.15*[${PYTHON_USEDEP}] )
	testing-no-myst? ( >=dev-python/pytest-8.3[${PYTHON_USEDEP}] =dev-python/pytest-8*[${PYTHON_USEDEP}] )
	testing-no-myst? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	testing-no-myst? ( dev-python/pytest-regressions[${PYTHON_USEDEP}] )
	>=dev-python/sphinx-6[${PYTHON_USEDEP}] <dev-python/sphinx-9[${PYTHON_USEDEP}]
	theme-sbt? ( >=dev-python/sphinx-book-theme-1.1[${PYTHON_USEDEP}] =dev-python/sphinx-book-theme-1*[${PYTHON_USEDEP}] )
	theme-im? ( >=dev-python/sphinx-immaterial-0.12.2[${PYTHON_USEDEP}] =dev-python/sphinx-immaterial-0.12*[${PYTHON_USEDEP}] )
	theme-rtd? ( >=dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] =dev-python/sphinx-rtd-theme-2*[${PYTHON_USEDEP}] )
	code-style? ( >=dev-vcs/pre-commit-3[${PYTHON_USEDEP}] <dev-vcs/pre-commit-4[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/defusedxml[${PYTHON_USEDEP}]
		>=dev-python/myst-parser-2[${PYTHON_USEDEP}] <dev-python/myst-parser-4[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3[${PYTHON_USEDEP}] =dev-python/pytest-8*[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
