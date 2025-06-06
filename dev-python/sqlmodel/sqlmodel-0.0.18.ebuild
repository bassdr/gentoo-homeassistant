# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sqlmodel/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	SQLAlchemy<2.1.0,>=2.0.0
	pydantic<3.0.0,>=1.10.13
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/pydantic-1.10.13[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.0[${PYTHON_USEDEP}] <dev-python/sqlalchemy-2.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
