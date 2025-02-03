# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="datetime"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/typepy/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	<dev-python/mbstrdecoder-2[${PYTHON_USEDEP}]
	datetime? ( dev-python/packaging[${PYTHON_USEDEP}] )
	datetime? ( <dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}] )
	datetime? ( >=dev-python/pytz-2018.9[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.1[${PYTHON_USEDEP}]
		<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytz-2018.9[${PYTHON_USEDEP}]
		dev-python/tcolorpy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
