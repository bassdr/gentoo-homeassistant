# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli docs sphinx"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-autodoc2/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	astroid>=2.7,<4
	furo ; extra == "docs"
	myst-parser ; extra == "docs"
	pytest ; extra == "testing"
	pytest-cov ; extra == "testing"
	pytest-regressions ; extra == "testing"
	sphinx>=4.0.0 ; extra == "docs"
	sphinx>=4.0.0 ; extra == "sphinx"
	sphinx>=4.0.0,<7 ; extra == "testing"
	tomli; python_version<'3.11'
	typer[all] ; extra == "cli"
	typing-extensions
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/astroid-2.7[${PYTHON_USEDEP}] <dev-python/astroid-4[${PYTHON_USEDEP}]
	docs? ( dev-python/furo[${PYTHON_USEDEP}] )
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}] )
	sphinx? ( >=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}] )
	cli? ( dev-python/typer[all,${PYTHON_USEDEP}] )
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-regressions[${PYTHON_USEDEP}]
		>=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}] <dev-python/sphinx-7[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
