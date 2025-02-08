# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/furiosa-common/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	aiofiles
	aiohttp~=3.8.3
	multipledispatch
	mypy; extra == "test"
	packaging
	pytest-aiohttp; extra == "test"
	pytest-asyncio~=0.17.2; extra == "test"
	pytest-cov; extra == "test"
	pytest; extra == "test"
	ruff; extra == "test"
	tqdm
	types-aiofiles; extra == "test"
	types-tqdm; extra == "test"
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}] =dev-python/aiohttp-3.8*[${PYTHON_USEDEP}]
	dev-python/multipledispatch[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17.2[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0.17*[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/types-aiofiles[${PYTHON_USEDEP}]
		dev-python/types-tqdm[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
