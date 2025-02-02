# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="dev docs test types"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/aleph-alpha-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.8.3[${PYTHON_USEDEP}]
	dev? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	types? ( dev-python/mypy[${PYTHON_USEDEP}] )
	dev? ( dev-python/nbconvert[${PYTHON_USEDEP}] )
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.2.0[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-aiohttp[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-dotenv[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-httpserver[${PYTHON_USEDEP}] )
	>=dev-python/python-liquid-1.9.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28[${PYTHON_USEDEP}]
	dev? ( dev-python/ruff[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	>=dev-python/tqdm-4.62.0[${PYTHON_USEDEP}]
	types? ( dev-python/types-pillow[${PYTHON_USEDEP}] )
	types? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	types? ( dev-python/types-tqdm[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	>=sci-libs/tokenizers-0.13.2[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
