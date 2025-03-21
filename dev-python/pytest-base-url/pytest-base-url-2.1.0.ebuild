# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest-base-url/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black>=22.1.0; extra == 'test'
	flake8>=4.0.1; extra == 'test'
	pre-commit>=2.17.0; extra == 'test'
	pytest-localserver>=0.7.1; extra == 'test'
	pytest>=7.0.0
	requests>=2.9
	tox>=3.24.5; extra == 'test'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.9[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/black-22.1.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-4.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-localserver-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/tox-3.24.5[${PYTHON_USEDEP}]
		>=dev-vcs/pre-commit-2.17.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
