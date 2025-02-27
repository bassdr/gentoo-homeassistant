# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs speed test voice"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/discord-py/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Brotli; extra == 'speed'
	PyNaCl<1.6,>=1.3.0; extra == 'voice'
	aiodns>=1.1; sys_platform != 'win32' and extra == 'speed'
	aiohttp<4,>=3.7.4
	audioop-lts; python_version >= '3.13'
	black==22.6; extra == 'dev'
	cchardet==2.1.7; python_version < '3.10' and extra == 'speed'
	coverage[toml]; extra == 'test'
	imghdr-lts==1.0.0; python_version >= '3.13' and extra == 'docs'
	orjson>=3.5.4; extra == 'speed'
	pytest-asyncio; extra == 'test'
	pytest-cov; extra == 'test'
	pytest-mock; extra == 'test'
	pytest; extra == 'test'
	sphinx-inline-tabs==2023.4.21; extra == 'docs'
	sphinx==4.4.0; extra == 'docs'
	sphinxcontrib-applehelp==1.0.4; extra == 'docs'
	sphinxcontrib-devhelp==1.0.2; extra == 'docs'
	sphinxcontrib-htmlhelp==2.0.1; extra == 'docs'
	sphinxcontrib-jsmath==1.0.1; extra == 'docs'
	sphinxcontrib-qthelp==1.0.3; extra == 'docs'
	sphinxcontrib-serializinghtml==1.1.5; extra == 'docs'
	sphinxcontrib-websupport==1.2.4; extra == 'docs'
	sphinxcontrib_trio==1.1.2; extra == 'docs'
	typing-extensions<5,>=4.3; extra == 'docs'
	typing-extensions<5,>=4.3; extra == 'test'
	typing_extensions<5,>=4.3; extra == 'dev'
	tzdata; sys_platform == 'win32' and extra == 'test'
	zstandard>=0.23.0; extra == 'speed'
"
GENERATED_RDEPEND="${RDEPEND}
	speed? ( app-arch/brotli[python,${PYTHON_USEDEP}] )
	speed? ( >=dev-python/aiodns-1.1[${PYTHON_USEDEP}] )
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/audioop-lts[${PYTHON_USEDEP}]' python3_13{,t})
	docs? ( $(python_gen_cond_dep '~dev-python/imghdr-lts-1.0.0[${PYTHON_USEDEP}]' python3_13{,t}) )
	speed? ( >=dev-python/orjson-3.5.4[${PYTHON_USEDEP}] )
	voice? ( >=dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] <dev-python/pynacl-1.6[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-4.4.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-inline-tabs-2023.4.21[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-applehelp-1.0.4[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-devhelp-1.0.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-htmlhelp-2.0.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-jsmath-1.0.1[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-qthelp-1.0.3[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-serializinghtml-1.1.5[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-trio-1.1.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinxcontrib-websupport-1.2.4[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}] )
	speed? ( >=dev-python/zstandard-0.23.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-22.6[${PYTHON_USEDEP}]
		dev-python/coverage[toml,${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.3[${PYTHON_USEDEP}] <dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
