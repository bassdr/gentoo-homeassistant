# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sphinx-autodoc-defaultargs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Sphinx (>=3.0)
	Sphinx (>=3.2.0) ; extra == 'test'
	dataclasses ; (python_version == '3.6') and extra == 'test'
	pytest (>=3.1.0) ; extra == 'test'
	sphobjinv (>=2.0) ; extra == 'test'
	typed-ast (>=1.4.0) ; (python_version < '3.8') and extra == 'type_comments'
	typing-extensions (>=3.5) ; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/sphinx-3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/pytest-3.1.0[${PYTHON_USEDEP}]
		>=dev-python/sphinx-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/sphobjinv-2.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-3.5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
