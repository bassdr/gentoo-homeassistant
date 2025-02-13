# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all orjson playground postgres sqlite"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/piccolo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	all? ( >=dev-python/aiosqlite-0.16.0[${PYTHON_USEDEP}] )
	sqlite? ( >=dev-python/aiosqlite-0.16.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}] )
	postgres? ( >=dev-python/asyncpg-0.30.0[${PYTHON_USEDEP}] )
	dev-python/black[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/inflection-0.5.1[${PYTHON_USEDEP}]
	all? ( dev-python/ipython[${PYTHON_USEDEP}] )
	playground? ( dev-python/ipython[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-2.11.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/orjson-3.5.1[${PYTHON_USEDEP}] )
	orjson? ( >=dev-python/orjson-3.5.1[${PYTHON_USEDEP}] )
	~dev-python/pydantic-2[email,${PYTHON_USEDEP}]
	>=dev-python/targ-0.3.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
