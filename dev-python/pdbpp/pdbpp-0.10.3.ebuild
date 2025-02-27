# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="funcsigs test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pdbpp/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	fancycompleter (>=0.8)
	funcsigs ; extra == 'funcsigs'
	funcsigs ; extra == 'testing'
	pygments
	pytest ; extra == 'testing'
	wmctrl
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/fancycompleter-0.8[${PYTHON_USEDEP}]
	funcsigs? ( dev-python/funcsigs[${PYTHON_USEDEP}] )
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/wmctrl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/funcsigs[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

