# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="anthropic aws cohere community deepseek fireworks google-genai google-vertexai groq huggingface mistralai ollama openai together"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/langchain/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	PyYAML>=5.3
	SQLAlchemy<3,>=1.4
	aiohttp<4.0.0,>=3.8.3
	async-timeout<5.0.0,>=4.0.0; python_version < '3.11'
	langchain-anthropic; extra == 'anthropic'
	langchain-aws; extra == 'aws'
	langchain-cohere; extra == 'cohere'
	langchain-community; extra == 'community'
	langchain-core<1.0.0,>=0.3.34
	langchain-deepseek; extra == 'deepseek'
	langchain-fireworks; extra == 'fireworks'
	langchain-google-genai; extra == 'google-genai'
	langchain-google-vertexai; extra == 'google-vertexai'
	langchain-groq; extra == 'groq'
	langchain-huggingface; extra == 'huggingface'
	langchain-mistralai; extra == 'mistralai'
	langchain-ollama; extra == 'ollama'
	langchain-openai; extra == 'openai'
	langchain-text-splitters<1.0.0,>=0.3.6
	langchain-together; extra == 'together'
	langsmith<0.4,>=0.1.17
	numpy<2,>=1.26.4; python_version < '3.12'
	numpy<3,>=1.26.2; python_version >= '3.12'
	pydantic<3.0.0,>=2.7.4
	requests<3,>=2
	tenacity!=8.4.0,<10,>=8.1.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.8.3[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	anthropic? ( dev-python/langchain-anthropic[${PYTHON_USEDEP}] )
	aws? ( dev-python/langchain-aws[${PYTHON_USEDEP}] )
	cohere? ( dev-python/langchain-cohere[${PYTHON_USEDEP}] )
	community? ( dev-python/langchain-community[${PYTHON_USEDEP}] )
	>=dev-python/langchain-core-0.3.34[${PYTHON_USEDEP}] <dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	deepseek? ( dev-python/langchain-deepseek[${PYTHON_USEDEP}] )
	fireworks? ( dev-python/langchain-fireworks[${PYTHON_USEDEP}] )
	google-genai? ( dev-python/langchain-google-genai[${PYTHON_USEDEP}] )
	google-vertexai? ( dev-python/langchain-google-vertexai[${PYTHON_USEDEP}] )
	groq? ( dev-python/langchain-groq[${PYTHON_USEDEP}] )
	huggingface? ( dev-python/langchain-huggingface[${PYTHON_USEDEP}] )
	mistralai? ( dev-python/langchain-mistralai[${PYTHON_USEDEP}] )
	ollama? ( dev-python/langchain-ollama[${PYTHON_USEDEP}] )
	openai? ( dev-python/langchain-openai[${PYTHON_USEDEP}] )
	>=dev-python/langchain-text-splitters-0.3.6[${PYTHON_USEDEP}] <dev-python/langchain-text-splitters-1.0.0[${PYTHON_USEDEP}]
	together? ( dev-python/langchain-together[${PYTHON_USEDEP}] )
	>=dev-python/langsmith-0.1.17[${PYTHON_USEDEP}] <dev-python/langsmith-0.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.2[${PYTHON_USEDEP}] <dev-python/numpy-3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}] <dev-python/sqlalchemy-3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.1.0[${PYTHON_USEDEP}] <dev-python/tenacity-10[${PYTHON_USEDEP}] !~dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
