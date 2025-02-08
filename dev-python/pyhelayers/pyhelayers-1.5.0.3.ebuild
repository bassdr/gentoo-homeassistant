# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="ext"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pyhelayers/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	numpy (>=1.14.5)
	scikit-learn (>=0.20.0) ; extra == 'ext'
	sklearn-json (>=0.1.0) ; extra == 'ext'
	tensorflow (>=2.0.0) ; extra == 'ext'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/numpy-1.14.5[${PYTHON_USEDEP}]
	ext? ( >=dev-python/scikit-learn-0.20.0[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/sklearn-json-0.1.0[${PYTHON_USEDEP}] )
	ext? ( >=dev-python/tensorflow-2.0.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest

