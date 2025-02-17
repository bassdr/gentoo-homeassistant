# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="uv"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/check-sdist/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	build>=1.2
	importlib-resources; python_version < '3.9'
	pathspec
	pyproject-hooks!=1.1.0; extra == 'test'
	pytest-cov>=3; extra == 'test'
	pytest>=6; extra == 'test'
	tomli; python_version < '3.11'
	uv; extra == 'uv'
	validate-pyproject>=0.16; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/build-1.2[${PYTHON_USEDEP}]
	dev-python/pathspec[${PYTHON_USEDEP}]
	uv? ( dev-python/uv )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		!~dev-python/pyproject-hooks-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3[${PYTHON_USEDEP}]
		>=dev-python/validate-pyproject-0.16[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
