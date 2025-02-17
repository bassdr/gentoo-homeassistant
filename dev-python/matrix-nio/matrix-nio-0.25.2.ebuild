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
REQUIRES_DIST="
	aiofiles~=24.1
	aiohttp-socks~=0.8
	aiohttp~=3.10
	aioresponses~=0.7; extra == 'dev'
	atomicwrites~=1.4; extra == 'e2e'
	cachetools~=5.3; extra == 'e2e'
	faker~=8.0; extra == 'dev'
	h11~=0.14
	h2~=4.0
	hpack~=4.0; extra == 'dev'
	hyperframe~=6.0; extra == 'dev'
	hypothesis~=6.8; extra == 'dev'
	jsonschema~=4.14
	matrix-nio[dev]; extra == 'docs'
	matrix-nio[e2e]; extra == 'dev'
	mypy-extensions~=1.0; extra == 'dev'
	mypy~=1.11; extra == 'dev'
	peewee~=3.14; extra == 'e2e'
	pre-commit; extra == 'dev'
	pycryptodome~=3.10
	pytest-aiohttp~=0.3; extra == 'dev'
	pytest-asyncio~=0.24; extra == 'dev'
	pytest-benchmark~=4.0; extra == 'dev'
	pytest-cov~=2.11; extra == 'dev'
	pytest-flake8~=1.2; extra == 'dev'
	pytest~=8.2; extra == 'dev'
	python-olm~=3.2; extra == 'e2e'
	setuptools>=61.0; extra == 'docs'
	sphinx-autodoc-typehints~=2.1; extra == 'docs'
	sphinx-mdinclude>=0.5; extra == 'docs'
	sphinx-rtd-theme~=2.0; extra == 'docs'
	sphinx~=7.4; extra == 'docs'
	unpaddedbase64~=2.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-24.1[${PYTHON_USEDEP}] =dev-python/aiofiles-24*[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10[${PYTHON_USEDEP}] =dev-python/aiohttp-3*[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-socks-0.8[${PYTHON_USEDEP}] =dev-python/aiohttp-socks-0*[${PYTHON_USEDEP}]
	e2e? ( >=dev-python/atomicwrites-1.4[${PYTHON_USEDEP}] =dev-python/atomicwrites-1*[${PYTHON_USEDEP}] )
	e2e? ( >=dev-python/cachetools-5.3[${PYTHON_USEDEP}] =dev-python/cachetools-5*[${PYTHON_USEDEP}] )
	>=dev-python/h11-0.14[${PYTHON_USEDEP}] =dev-python/h11-0*[${PYTHON_USEDEP}]
	>=dev-python/h2-4.0[${PYTHON_USEDEP}] =dev-python/h2-4*[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.14[${PYTHON_USEDEP}] =dev-python/jsonschema-4*[${PYTHON_USEDEP}]
	docs? ( dev-python/matrix-nio[dev,${PYTHON_USEDEP}] )
	e2e? ( >=dev-python/peewee-3.14[${PYTHON_USEDEP}] =dev-python/peewee-3*[${PYTHON_USEDEP}] )
	>=dev-python/pycryptodome-3.10[${PYTHON_USEDEP}] =dev-python/pycryptodome-3*[${PYTHON_USEDEP}]
	e2e? ( >=dev-python/python-olm-3.2[${PYTHON_USEDEP}] =dev-python/python-olm-3*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/setuptools-61.0[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-7.4[${PYTHON_USEDEP}] =dev-python/sphinx-7*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-autodoc-typehints-2.1[${PYTHON_USEDEP}] =dev-python/sphinx-autodoc-typehints-2*[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-mdinclude-0.5[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-2.0[${PYTHON_USEDEP}] =dev-python/sphinx-rtd-theme-2*[${PYTHON_USEDEP}] )
	>=dev-python/unpaddedbase64-2.1[${PYTHON_USEDEP}] =dev-python/unpaddedbase64-2*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/aioresponses-0.7[${PYTHON_USEDEP}] =dev-python/aioresponses-0*[${PYTHON_USEDEP}]
		>=dev-python/faker-8.0[${PYTHON_USEDEP}] =dev-python/faker-8*[${PYTHON_USEDEP}]
		>=dev-python/hpack-4.0[${PYTHON_USEDEP}] =dev-python/hpack-4*[${PYTHON_USEDEP}]
		>=dev-python/hyperframe-6.0[${PYTHON_USEDEP}] =dev-python/hyperframe-6*[${PYTHON_USEDEP}]
		>=dev-python/hypothesis-6.8[${PYTHON_USEDEP}] =dev-python/hypothesis-6*[${PYTHON_USEDEP}]
		dev-python/matrix-nio[e2e,${PYTHON_USEDEP}]
		>=dev-python/mypy-1.11[${PYTHON_USEDEP}] =dev-python/mypy-1*[${PYTHON_USEDEP}]
		>=dev-python/mypy-extensions-1.0[${PYTHON_USEDEP}] =dev-python/mypy-extensions-1*[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.2[${PYTHON_USEDEP}] =dev-python/pytest-8*[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-0.3[${PYTHON_USEDEP}] =dev-python/pytest-aiohttp-0*[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}] =dev-python/pytest-asyncio-0*[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-4.0[${PYTHON_USEDEP}] =dev-python/pytest-benchmark-4*[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-2.11[${PYTHON_USEDEP}] =dev-python/pytest-cov-2*[${PYTHON_USEDEP}]
		>=dev-python/pytest-flake8-1.2[${PYTHON_USEDEP}] =dev-python/pytest-flake8-1*[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
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
