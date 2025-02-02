# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
IUSE=""

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/scmrepo/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="${RDEPEND}
	>=dev-python/aiohttp-retry-2.5.0[${PYTHON_USEDEP}]
	<dev-python/asyncssh-3[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.22.1[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2024.2.0[tqdm,${PYTHON_USEDEP}]
	>=dev-python/funcy-1.14[${PYTHON_USEDEP}]
	>dev-python/gitpython-3[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/pygit2-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.3.2[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
BDEPEND+=" test? (
	<dev-python/aioresponses-0.8[${PYTHON_USEDEP}]
	~dev-python/mypy-1.14.1[${PYTHON_USEDEP}]
	<dev-python/paramiko-4[${PYTHON_USEDEP}]
	dev-python/proxy-py[${PYTHON_USEDEP}]
	<dev-python/pytest-9[${PYTHON_USEDEP}]
	<dev-python/pytest-asyncio-1[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
	<dev-python/pytest-docker-4[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}]
	dev-python/pytest-sugar[${PYTHON_USEDEP}]
	<dev-python/pytest-test-utils-0.2[${PYTHON_USEDEP}]
	dev-python/scmrepo[tests,${PYTHON_USEDEP}]
	dev-python/types-certifi[${PYTHON_USEDEP}]
	dev-python/types-mock[${PYTHON_USEDEP}]
	dev-python/types-paramiko[${PYTHON_USEDEP}]
	dev-python/types-tqdm[${PYTHON_USEDEP}]
)"
