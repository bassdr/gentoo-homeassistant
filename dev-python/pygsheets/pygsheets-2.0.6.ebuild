# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="pandas"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pygsheets/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	enum34 (>=1.1.6) ; python_version < '3.4'
	google-api-python-client (>=2.50.0)
	google-auth-oauthlib (>=0.7.1)
	pandas (>=0.14.0) ; extra == 'pandas'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/google-api-python-client-2.50.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-0.7.1[${PYTHON_USEDEP}]
	pandas? ( >=dev-python/pandas-0.14.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
