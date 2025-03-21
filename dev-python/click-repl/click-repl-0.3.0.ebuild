# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/click-repl/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	click (>=7.0)
	prompt-toolkit (>=3.0.36)
	pytest (>=7.2.1) ; extra == 'testing'
	pytest-cov (>=4.0.0) ; extra == 'testing'
	tox (>=4.4.3) ; extra == 'testing'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.36[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-7.2.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/tox-4.4.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
