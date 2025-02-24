# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pre-commit-uv/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	covdefaults>=2.3; extra == 'testing'
	pre-commit>=3.8
	pytest-cov>=5; extra == 'testing'
	pytest-mock>=3.14; extra == 'testing'
	pytest>=8.3.2; extra == 'testing'
	uv>=0.4.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/uv-0.4.7
	>=dev-vcs/pre-commit-3.8[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/covdefaults-2.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5[${PYTHON_USEDEP}]
		>=dev-python/pytest-mock-3.14[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

