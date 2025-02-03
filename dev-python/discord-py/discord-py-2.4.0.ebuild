# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs speed voice"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/discord.py/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	speed? ( >=dev-python/aiodns-1.1[${PYTHON_USEDEP}] )
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	speed? ( dev-python/brotli[${PYTHON_USEDEP}] )
	speed? ( >=dev-python/orjson-3.5.4[${PYTHON_USEDEP}] )
	voice? ( <dev-python/pynacl-1.6[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-4.4.0[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinx-inline-tabs-2023.4.21[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-applehelp-1.0.4[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-devhelp-1.0.2[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-htmlhelp-2.0.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-qthelp-1.0.3[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-serializinghtml-1.1.5[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-trio-1.1.2[${PYTHON_USEDEP}] )
	docs? ( =dev-python/sphinxcontrib-websupport-1.2.4[${PYTHON_USEDEP}] )
	docs? ( <dev-python/typing-extensions-5[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
