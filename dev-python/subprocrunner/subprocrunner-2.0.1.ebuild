# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="logging"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/subprocrunner/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	loguru<1,>=0.4.1; extra == "logging"
	loguru<1,>=0.4.1; extra == "test"
	mbstrdecoder<2,>=1.0.0
	pytest-mock; extra == "test"
	pytest; extra == "test"
	typepy; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	logging? ( >=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}] )
	>=dev-python/mbstrdecoder-1.0.0[${PYTHON_USEDEP}] <dev-python/mbstrdecoder-2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/loguru-0.4.1[${PYTHON_USEDEP}] <dev-python/loguru-1[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/typepy[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
