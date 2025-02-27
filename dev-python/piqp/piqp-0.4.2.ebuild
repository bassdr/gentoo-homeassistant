# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/piqp/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"


distutils_enable_tests pytest
REQUIRES_DIST="
	numpy; extra == 'test'
	pytest>=6.0; extra == 'test'
	scipy; extra == 'test'
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
