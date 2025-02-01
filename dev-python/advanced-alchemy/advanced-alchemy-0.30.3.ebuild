# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="cli nanoid uuid"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/advanced-alchemy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${PYTHON_DEPS}
	>=dev-python/alembic-1.12.0[${PYTHON_USEDEP}]
	dev-python/eval-type-backport[${PYTHON_USEDEP}]
	nanoid? ( >=dev-python/fastnanoid-0.4.1[${PYTHON_USEDEP}] )
	dev-python/greenlet[${PYTHON_USEDEP}]
	cli? ( dev-python/rich-click[${PYTHON_USEDEP}] )
	>=dev-python/sqlalchemy-2.0.20[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	uuid? ( >=dev-python/uuid-utils-0.6.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
