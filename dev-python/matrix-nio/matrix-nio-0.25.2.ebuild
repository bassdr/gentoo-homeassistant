# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_PV="${PV/_/}"

DESCRIPTION="A Python Matrix client library, designed according to sans I/O principles."
HOMEPAGE="
  https://pypi.org/project/matrix-nio/
  Source, https://github.com/matrix-nio/matrix-nio
  Documentation, https://matrix-nio.readthedocs.io/en/latest/
"
SRC_URI="https://github.com/matrix-nio/matrix-nio/archive/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm64"

PROPERTIES="test_network"
RESTRICT="test !test? ( test )"

GENERATED_IUSE="docs e2e"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	~dev-python/aiofiles-24.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.10[${PYTHON_USEDEP}]
	~dev-python/aiohttp-socks-0.8[${PYTHON_USEDEP}]
	e2e? ( ~dev-python/atomicwrites-1.4[${PYTHON_USEDEP}] )
	e2e? ( ~dev-python/cachetools-5.3[${PYTHON_USEDEP}] )
	~dev-python/h11-0.14[${PYTHON_USEDEP}]
	~dev-python/h2-4.0[${PYTHON_USEDEP}]
	~dev-python/jsonschema-4.14[${PYTHON_USEDEP}]
	docs? ( dev-python/matrix-nio[dev,${PYTHON_USEDEP}] )
	e2e? ( ~dev-python/peewee-3.14[${PYTHON_USEDEP}] )
	~dev-python/pycryptodome-3.10[${PYTHON_USEDEP}]
	e2e? ( ~dev-python/python-olm-3.2[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/setuptools-61.0[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-7.4[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-autodoc-typehints-2.1[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-mdinclude-0.5[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] )
	~dev-python/unpaddedbase64-2.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/python-olm-3.2.15[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-socks-0.8.4[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/h2-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.14.0[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.10.1[${PYTHON_USEDEP}]
	>=dev-python/unpaddedbase64-2.1.0[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		>=dev-python/aioresponses-0.7.4[${PYTHON_USEDEP}]
		>=dev-python/faker-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/hpack-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/hyperframe-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.8.9[${PYTHON_USEDEP}]
		>=dev-python/mypy-0.812[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
BDEPEND+=" test? (
	~dev-python/aioresponses-0.7[${PYTHON_USEDEP}]
	~dev-python/faker-8.0[${PYTHON_USEDEP}]
	~dev-python/hpack-4.0[${PYTHON_USEDEP}]
	~dev-python/hyperframe-6.0[${PYTHON_USEDEP}]
	~dev-python/hypothesis-6.8[${PYTHON_USEDEP}]
	dev-python/matrix-nio[e2e,${PYTHON_USEDEP}]
	~dev-python/mypy-1.11[${PYTHON_USEDEP}]
	~dev-python/mypy-extensions-1.0[${PYTHON_USEDEP}]
	~dev-python/pytest-8.2[${PYTHON_USEDEP}]
	~dev-python/pytest-aiohttp-0.3[${PYTHON_USEDEP}]
	~dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
	~dev-python/pytest-benchmark-4.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-2.11[${PYTHON_USEDEP}]
	~dev-python/pytest-flake8-1.2[${PYTHON_USEDEP}]
	dev-vcs/pre-commit[${PYTHON_USEDEP}]
)"
distutils_enable_sphinx doc dev-python/sphinx-autodoc-typehints dev-python/sphinx-rtd-theme dev-python/sphinx-mdinclude

EPYTEST_DESELECT=(
	# breaks network sandbox
	"tests/async_client_test.py::TestClass::test_connect_wrapper"
	# requires pytest-benchmark, not much value in pass/no pass tests
	"tests/key_export_test.py::TestClass::test_decrypt_rounds"
	"tests/key_export_test.py::TestClass::test_encrypt_rounds"
	# flaky
	"tests/async_client_test.py::TestClass::test_transfer_monitor_callbacks"
)
