# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="docs rich"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/datasette/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	Jinja2>=2.10.3
	PyYAML>=5.3
	aiofiles>=0.4
	asgi-csrf>=0.9
	asgiref>=3.2.10
	beautifulsoup4>=4.8.1; extra == "test"
	black==24.4.2; extra == "test"
	blacken-docs; extra == "docs"
	blacken-docs==1.12.1; extra == "test"
	click-default-group>=1.2.3
	click>=7.1.1
	codespell; extra == "docs"
	cogapp>=3.3.0; extra == "test"
	flexcache>=0.3
	flexparser>=0.3
	furo==2024.8.6; extra == "docs"
	httpx>=0.20
	hupper>=1.9
	itsdangerous>=1.1
	janus>=0.6.2
	mergedeep>=1.1.1
	pip
	platformdirs>=2.1.0
	pluggy>=1.0
	pytest-asyncio>=0.17; extra == "test"
	pytest-timeout>=1.4.2; extra == "test"
	pytest-xdist>=2.2.1; extra == "test"
	pytest>=5.2.2; extra == "test"
	rich; extra == "rich"
	setuptools
	sphinx-autobuild; extra == "docs"
	sphinx-copybutton; extra == "docs"
	trustme>=0.7; extra == "test"
	typing_extensions>=4.0.0
	uvicorn>=0.11
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-0.4[${PYTHON_USEDEP}]
	>=dev-python/asgi-csrf-0.9[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.2.10[${PYTHON_USEDEP}]
	docs? ( dev-python/blacken-docs[${PYTHON_USEDEP}] )
	>=dev-python/click-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/click-default-group-1.2.3[${PYTHON_USEDEP}]
	docs? ( dev-python/codespell[${PYTHON_USEDEP}] )
	>=dev-python/flexcache-0.3[${PYTHON_USEDEP}]
	>=dev-python/flexparser-0.3[${PYTHON_USEDEP}]
	docs? ( ~dev-python/furo-2024.8.6[${PYTHON_USEDEP}] )
	>=dev-python/httpx-0.20[${PYTHON_USEDEP}]
	>=dev-python/hupper-1.9[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-1.1[${PYTHON_USEDEP}]
	>=dev-python/janus-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.10.3[${PYTHON_USEDEP}]
	>=dev-python/mergedeep-1.1.1[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	rich? ( dev-python/rich[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/beautifulsoup4-4.8.1[${PYTHON_USEDEP}]
		~dev-python/black-24.4.2[${PYTHON_USEDEP}]
		~dev-python/blacken-docs-1.12.1[${PYTHON_USEDEP}]
		>=dev-python/cogapp-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-5.2.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-1.4.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/trustme-0.7[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
