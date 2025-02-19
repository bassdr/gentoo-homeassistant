# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="GraphQL client for Python"
HOMEPAGE="
  https://pypi.org/project/gql/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="aiohttp all botocore httpx requests test test_no_transport websockets"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiofiles ; extra == 'dev'
	aiofiles ; extra == 'test'
	aiofiles ; extra == 'test_no_transport'
	aiohttp <4,>=3.8.0 ; (python_version <= '3.11') and extra == 'aiohttp'
	aiohttp <4,>=3.8.0 ; (python_version <= '3.11') and extra == 'all'
	aiohttp <4,>=3.8.0 ; (python_version <= '3.11') and extra == 'dev'
	aiohttp <4,>=3.8.0 ; (python_version <= '3.11') and extra == 'test'
	aiohttp <4,>=3.9.0b0 ; (python_version > '3.11') and extra == 'aiohttp'
	aiohttp <4,>=3.9.0b0 ; (python_version > '3.11') and extra == 'all'
	aiohttp <4,>=3.9.0b0 ; (python_version > '3.11') and extra == 'dev'
	aiohttp <4,>=3.9.0b0 ; (python_version > '3.11') and extra == 'test'
	anyio <5,>=3.0
	backoff <3.0,>=1.11.1
	black ==22.3.0 ; extra == 'dev'
	botocore <2,>=1.21 ; extra == 'all'
	botocore <2,>=1.21 ; extra == 'botocore'
	botocore <2,>=1.21 ; extra == 'dev'
	botocore <2,>=1.21 ; extra == 'test'
	check-manifest <1,>=0.42 ; extra == 'dev'
	flake8 ==3.8.1 ; extra == 'dev'
	graphql-core <3.3,>=3.2
	httpx <1,>=0.23.1 ; extra == 'all'
	httpx <1,>=0.23.1 ; extra == 'dev'
	httpx <1,>=0.23.1 ; extra == 'httpx'
	httpx <1,>=0.23.1 ; extra == 'test'
	isort ==4.3.21 ; extra == 'dev'
	mock ==4.0.2 ; extra == 'dev'
	mock ==4.0.2 ; extra == 'test'
	mock ==4.0.2 ; extra == 'test_no_transport'
	mypy ==0.910 ; extra == 'dev'
	parse ==1.15.0 ; extra == 'dev'
	parse ==1.15.0 ; extra == 'test'
	parse ==1.15.0 ; extra == 'test_no_transport'
	pytest ==7.4.2 ; extra == 'dev'
	pytest ==7.4.2 ; extra == 'test'
	pytest ==7.4.2 ; extra == 'test_no_transport'
	pytest-asyncio ==0.21.1 ; extra == 'dev'
	pytest-asyncio ==0.21.1 ; extra == 'test'
	pytest-asyncio ==0.21.1 ; extra == 'test_no_transport'
	pytest-console-scripts ==1.3.1 ; extra == 'dev'
	pytest-console-scripts ==1.3.1 ; extra == 'test'
	pytest-console-scripts ==1.3.1 ; extra == 'test_no_transport'
	pytest-cov ==3.0.0 ; extra == 'dev'
	pytest-cov ==3.0.0 ; extra == 'test'
	pytest-cov ==3.0.0 ; extra == 'test_no_transport'
	requests <3,>=2.26 ; extra == 'all'
	requests <3,>=2.26 ; extra == 'dev'
	requests <3,>=2.26 ; extra == 'requests'
	requests <3,>=2.26 ; extra == 'test'
	requests-toolbelt <2,>=1.0.0 ; extra == 'all'
	requests-toolbelt <2,>=1.0.0 ; extra == 'dev'
	requests-toolbelt <2,>=1.0.0 ; extra == 'requests'
	requests-toolbelt <2,>=1.0.0 ; extra == 'test'
	sphinx <6,>=5.3.0 ; extra == 'dev'
	sphinx-argparse ==0.2.5 ; extra == 'dev'
	sphinx-rtd-theme <1,>=0.4 ; extra == 'dev'
	types-aiofiles ; extra == 'dev'
	types-mock ; extra == 'dev'
	types-requests ; extra == 'dev'
	vcrpy ==4.4.0 ; extra == 'dev'
	vcrpy ==4.4.0 ; extra == 'test'
	vcrpy ==4.4.0 ; extra == 'test_no_transport'
	websockets <12,>=10 ; extra == 'all'
	websockets <12,>=10 ; extra == 'dev'
	websockets <12,>=10 ; extra == 'test'
	websockets <12,>=10 ; extra == 'websockets'
	yarl <2.0,>=1.6
"
GENERATED_RDEPEND="${RDEPEND}
	test_no_transport? ( dev-python/aiofiles[${PYTHON_USEDEP}] )
	aiohttp? ( >=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	all? ( >=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}] )
	>=dev-python/anyio-3.0[${PYTHON_USEDEP}] <dev-python/anyio-5[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}] <dev-python/backoff-3.0[${PYTHON_USEDEP}]
	all? ( >=dev-python/botocore-1.21[${PYTHON_USEDEP}] <dev-python/botocore-2[${PYTHON_USEDEP}] )
	botocore? ( >=dev-python/botocore-1.21[${PYTHON_USEDEP}] <dev-python/botocore-2[${PYTHON_USEDEP}] )
	>=dev-python/graphql-core-3.2[${PYTHON_USEDEP}] <dev-python/graphql-core-3.3[${PYTHON_USEDEP}]
	all? ( >=dev-python/httpx-0.23.1[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}] )
	httpx? ( >=dev-python/httpx-0.23.1[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/mock-4.0.2[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/parse-1.15.0[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-7.4.2[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-asyncio-0.21.1[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/requests-2.26[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/requests-2.26[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}] )
	all? ( >=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}] <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	requests? ( >=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}] <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/vcrpy-4.4.0[${PYTHON_USEDEP}] )
	all? ( >=dev-python/websockets-10[${PYTHON_USEDEP}] <dev-python/websockets-12[${PYTHON_USEDEP}] )
	websockets? ( >=dev-python/websockets-10[${PYTHON_USEDEP}] <dev-python/websockets-12[${PYTHON_USEDEP}] )
	>=dev-python/yarl-1.6[${PYTHON_USEDEP}] <dev-python/yarl-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/yarl-1.6[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/aiofiles[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.9.0_beta0[${PYTHON_USEDEP}] <dev-python/aiohttp-4[${PYTHON_USEDEP}]
		~dev-python/black-22.3.0[${PYTHON_USEDEP}]
		>=dev-python/botocore-1.21[${PYTHON_USEDEP}] <dev-python/botocore-2[${PYTHON_USEDEP}]
		>=dev-python/check-manifest-0.42[${PYTHON_USEDEP}] <dev-python/check-manifest-1[${PYTHON_USEDEP}]
		~dev-python/flake8-3.8.1[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.23.1[${PYTHON_USEDEP}] <dev-python/httpx-1[${PYTHON_USEDEP}]
		~dev-python/isort-4.3.21[${PYTHON_USEDEP}]
		~dev-python/mock-4.0.2[${PYTHON_USEDEP}]
		~dev-python/mypy-0.910[${PYTHON_USEDEP}]
		~dev-python/parse-1.15.0[${PYTHON_USEDEP}]
		~dev-python/pytest-7.4.2[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.21.1[${PYTHON_USEDEP}]
		~dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
		>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}] <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}]
		>=dev-python/sphinx-5.3.0[${PYTHON_USEDEP}] <dev-python/sphinx-6[${PYTHON_USEDEP}]
		~dev-python/sphinx-argparse-0.2.5[${PYTHON_USEDEP}]
		>=dev-python/sphinx-rtd-theme-0.4[${PYTHON_USEDEP}] <dev-python/sphinx-rtd-theme-1[${PYTHON_USEDEP}]
		dev-python/types-aiofiles[${PYTHON_USEDEP}]
		dev-python/types-mock[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
		~dev-python/vcrpy-4.4.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-10[${PYTHON_USEDEP}] <dev-python/websockets-12[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
