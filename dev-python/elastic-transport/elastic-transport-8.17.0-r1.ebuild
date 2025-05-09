# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=elastic-transport-python-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/elastic-transport/"
SRC_URI="
	https://github.com/elastic/elastic-transport-python/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
PROPERTIES="test_network"
RESTRICT="test"

GENERATED_IUSE="develop"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	aiohttp; extra == 'develop'
	certifi
	furo; extra == 'develop'
	httpcore<1.0.6; extra == 'develop'
	httpx; extra == 'develop'
	opentelemetry-api; extra == 'develop'
	opentelemetry-sdk; extra == 'develop'
	orjson; extra == 'develop'
	pytest-asyncio; extra == 'develop'
	pytest-cov; extra == 'develop'
	pytest-httpserver; extra == 'develop'
	pytest-mock; extra == 'develop'
	pytest; extra == 'develop'
	requests; extra == 'develop'
	respx; extra == 'develop'
	sphinx-autodoc-typehints; extra == 'develop'
	sphinx>2; extra == 'develop'
	trustme; extra == 'develop'
	urllib3<3,>=1.26.2
"
GENERATED_RDEPEND="${RDEPEND}
	develop? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	dev-python/certifi[${PYTHON_USEDEP}]
	develop? ( dev-python/furo[${PYTHON_USEDEP}] )
	develop? ( <dev-python/httpcore-1.0.6[${PYTHON_USEDEP}] )
	develop? ( dev-python/httpx[${PYTHON_USEDEP}] )
	develop? ( dev-python/opentelemetry-api[${PYTHON_USEDEP}] )
	develop? ( dev-python/opentelemetry-sdk[${PYTHON_USEDEP}] )
	develop? ( dev-python/orjson[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-asyncio[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-httpserver[${PYTHON_USEDEP}] )
	develop? ( dev-python/pytest-mock[${PYTHON_USEDEP}] )
	develop? ( dev-python/requests[${PYTHON_USEDEP}] )
	develop? ( dev-python/respx[${PYTHON_USEDEP}] )
	develop? ( >dev-python/sphinx-2[${PYTHON_USEDEP}] )
	develop? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	develop? ( dev-python/trustme[${PYTHON_USEDEP}] )
	>=dev-python/urllib3-1.26.2[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/opentelemetry-api[${PYTHON_USEDEP}]
		dev-python/opentelemetry-sdk[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/trustme[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs/sphinx \
	dev-python/furo \
	dev-python/sphinx-autodoc-typehints
EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# >=aiohttp-3.11 throws DeprecationWarning which cannot be filtered for this test
		# https://github.com/aio-libs/aiohttp/pull/9726
		# https://github.com/elastic/elastic-transport-python/pull/61
		tests/async_/test_httpserver.py::test_simple_request
		# fragile to random warnings
		tests/node/test_http_aiohttp.py::TestAiohttpHttpNode::test_uses_https_if_verify_certs_is_off
		tests/node/test_urllib3_chain_certs.py::test_assert_fingerprint_in_cert_chain
	)

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	# https://github.com/encode/httpx/discussions/3214#discussioncomment-10830925
	epytest -p asyncio -o addopts= -k "not (test_unsupported_tls_versions and HttpxAsyncHttpNode)"
}
