# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/natten/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fvcore<0.1.6,>=0.1.5; extra == 'all'
	fvcore<0.1.6,>=0.1.5; extra == 'dev'
	packaging
	torch>=2.0.0
"
GENERATED_RDEPEND="${RDEPEND}
	all? ( >=dev-python/fvcore-0.1.5[${PYTHON_USEDEP}] <dev-python/fvcore-0.1.6[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/torch-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/fvcore-0.1.5[${PYTHON_USEDEP}] <dev-python/fvcore-0.1.6[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
