# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="attrs beanie full msgspec odmantic pydantic sqlalchemy"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/polyfactory/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	attrs? ( >=dev-python/attrs-22.2.0[${PYTHON_USEDEP}] )
	full? ( dev-python/attrs[${PYTHON_USEDEP}] )
	beanie? ( dev-python/beanie[${PYTHON_USEDEP}] )
	full? ( dev-python/beanie[${PYTHON_USEDEP}] )
	dev-python/faker[${PYTHON_USEDEP}]
	full? ( dev-python/msgspec[${PYTHON_USEDEP}] )
	msgspec? ( dev-python/msgspec[${PYTHON_USEDEP}] )
	full? ( dev-python/odmantic[${PYTHON_USEDEP}] )
	odmantic? ( <dev-python/odmantic-1.0.0[${PYTHON_USEDEP}] )
	beanie? ( dev-python/pydantic[email,${PYTHON_USEDEP}] )
	full? ( dev-python/pydantic[${PYTHON_USEDEP}] )
	odmantic? ( dev-python/pydantic[email,${PYTHON_USEDEP}] )
	pydantic? ( >=dev-python/pydantic-1.10[email,${PYTHON_USEDEP}] )
	full? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
	sqlalchemy? ( >=dev-python/sqlalchemy-1.4.29[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
