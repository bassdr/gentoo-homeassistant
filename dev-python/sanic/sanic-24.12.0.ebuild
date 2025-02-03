# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="all docs ext http3"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/sanic/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-0.6.0[${PYTHON_USEDEP}]
	http3? ( dev-python/aioquic[${PYTHON_USEDEP}] )
	all? ( >=dev-python/autodocsumm-0.2.11[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/autodocsumm-0.2.11[${PYTHON_USEDEP}] )
	all? ( dev-python/bandit[${PYTHON_USEDEP}] )
	all? ( dev-python/beautifulsoup4[${PYTHON_USEDEP}] )
	all? ( =dev-python/chardet-3*[${PYTHON_USEDEP}] )
	all? ( dev-python/coverage[${PYTHON_USEDEP}] )
	all? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	all? ( dev-python/docutils[${PYTHON_USEDEP}] )
	docs? ( dev-python/docutils[${PYTHON_USEDEP}] )
	all? ( dev-python/enum-tools[sphinx,${PYTHON_USEDEP}] )
	docs? ( dev-python/enum-tools[sphinx,${PYTHON_USEDEP}] )
	>=dev-python/html5tagger-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.0.10[${PYTHON_USEDEP}]
	all? ( dev-python/m2r2[${PYTHON_USEDEP}] )
	docs? ( dev-python/m2r2[${PYTHON_USEDEP}] )
	all? ( <dev-python/mistune-2.0.0[${PYTHON_USEDEP}] )
	docs? ( <dev-python/mistune-2.0.0[${PYTHON_USEDEP}] )
	<dev-python/multidict-7.0[${PYTHON_USEDEP}]
	all? ( dev-python/mypy[${PYTHON_USEDEP}] )
	all? ( dev-python/pygments[${PYTHON_USEDEP}] )
	docs? ( dev-python/pygments[${PYTHON_USEDEP}] )
	all? ( >=dev-python/pytest-8.2.2[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-benchmark[${PYTHON_USEDEP}] )
	all? ( dev-python/pytest-sanic[${PYTHON_USEDEP}] )
	all? ( dev-python/ruff[${PYTHON_USEDEP}] )
	ext? ( dev-python/sanic-ext[${PYTHON_USEDEP}] )
	>=dev-python/sanic-routing-23.12.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/sanic-testing-23.6.0[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-70.1.0[${PYTHON_USEDEP}]
	all? ( <dev-python/slotscheck-1[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-2.1.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-2.1.2[${PYTHON_USEDEP}] )
	all? ( >=dev-python/sphinx-rtd-theme-0.4.3[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-0.4.3[${PYTHON_USEDEP}] )
	all? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	all? ( dev-python/tox[${PYTHON_USEDEP}] )
	>=dev-python/tracerite-1.0.0[${PYTHON_USEDEP}]
	dev-python/types-ujson[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	all? ( dev-python/uvicorn[${PYTHON_USEDEP}] )
	>=dev-python/websockets-10.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/bandit[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		=dev-python/chardet-3*[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/docutils[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.2.2[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-sanic[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		>=dev-python/sanic-testing-23.6.0[${PYTHON_USEDEP}]
		<dev-python/slotscheck-1[${PYTHON_USEDEP}]
		dev-python/towncrier[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
