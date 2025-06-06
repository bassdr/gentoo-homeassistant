# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="asymmetric-crypto"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/flask-jwt-extended/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Flask<4.0,>=2.0
	PyJWT<3.0,>=2.0
	Werkzeug>=0.14
	cryptography>=3.3.1; extra == 'asymmetric-crypto'
"
GENERATED_RDEPEND="${RDEPEND}
	asymmetric-crypto? ( >=dev-python/cryptography-3.3.1[${PYTHON_USEDEP}] )
	>=dev-python/flask-2.0[${PYTHON_USEDEP}] <dev-python/flask-4.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0[${PYTHON_USEDEP}] <dev-python/pyjwt-3.0[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-0.14[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
