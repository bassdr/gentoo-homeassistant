# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/picologging/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-memray-1.5.0[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
