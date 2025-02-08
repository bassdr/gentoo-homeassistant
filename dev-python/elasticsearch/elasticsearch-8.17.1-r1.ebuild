# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P="elasticsearch-py-${PV}"
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/elasticsearch/"
SRC_URI="
	https://github.com/elastic/elasticsearch-py/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0/$(ver_cut 1)"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="async docs orjson pyarrow requests vectorstore-mmr"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiohttp; extra == "dev"
	aiohttp<4,>=3; extra == "async"
	black; extra == "dev"
	build; extra == "dev"
	coverage; extra == "dev"
	elastic-transport<9,>=8.15.1
	isort; extra == "dev"
	jinja2; extra == "dev"
	mapbox-vector-tile; extra == "dev"
	nox; extra == "dev"
	numpy; extra == "dev"
	numpy>=1; extra == "vectorstore-mmr"
	orjson; extra == "dev"
	orjson>=3; extra == "orjson"
	pandas; extra == "dev"
	pyarrow; extra == "dev"
	pyarrow>=1; extra == "pyarrow"
	pytest-asyncio; extra == "dev"
	pytest-cov; extra == "dev"
	pytest; extra == "dev"
	python-dateutil; extra == "dev"
	pyyaml>=5.4; extra == "dev"
	requests!=2.32.2,<3.0.0,>=2.4.0; extra == "requests"
	requests<3,>=2; extra == "dev"
	simsimd; extra == "dev"
	simsimd>=3; extra == "vectorstore-mmr"
	sphinx-autodoc-typehints; extra == "docs"
	sphinx-rtd-theme>=2.0; extra == "docs"
	sphinx; extra == "docs"
	twine; extra == "dev"
	unasync; extra == "dev"
"
GENERATED_RDEPEND="${RDEPEND}
	async? ( >=dev-python/aiohttp-3[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	>=dev-python/elastic-transport-8.15.1[${PYTHON_USEDEP}] <dev-python/elastic-transport-9[${PYTHON_USEDEP}]
	vectorstore-mmr? ( >=dev-python/numpy-1[${PYTHON_USEDEP}] )
	orjson? ( >=dev-python/orjson-3[${PYTHON_USEDEP}] )
	pyarrow? ( >=dev-python/pyarrow-1[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/requests-2.4.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}] !~dev-python/requests-2.32.2[${PYTHON_USEDEP}] )
	vectorstore-mmr? ( >=dev-python/simsimd-3[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}]
	<dev-python/elastic-transport-9[${PYTHON_USEDEP}]
	>=dev-python/elastic-transport-8.15.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/mapbox-vector-tile[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/opentelemetry-api[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
		dev-python/unasync[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/sphinx \
	dev-python/sphinx-autodoc-typehints \
	dev-python/sphinx-rtd-theme
distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/mapbox-vector-tile[${PYTHON_USEDEP}]
		dev-python/nox[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.4[${PYTHON_USEDEP}]
		>=dev-python/requests-2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
		dev-python/simsimd[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/unasync[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_IGNORE=(
		# REST api tests are a black hole for effort. It downloads the tests
		# so its an ever moving target. It also requires effort to blacklist
		# tests for apis which are license restricted.
		"test_elasticsearch/test_server/test_rest_api_spec.py"
		# Counting deprecation warnings from python is bound to fail even
		# if all are fixed in this package. Not worth it.
		"test_elasticsearch/test_client/test_deprecated_options.py"
		# Running daemon for tests is finicky and upstream CI fails at it
		# as well.
		"test_elasticsearch/test_server/"
		"test_elasticsearch/test_async/test_server/"
	)

	local -x TEST_WITH_OTEL=1
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -o addopts= -p asyncio
}
