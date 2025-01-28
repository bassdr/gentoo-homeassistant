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
GENERATED_IUSE="all botocore dev httpx requests test test_no_transport websockets"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev? ( dev-python/aiofiles[${PYTHON_USEDEP}] )
	test? ( dev-python/aiofiles[${PYTHON_USEDEP}] )
	test_no_transport? ( dev-python/aiofiles[${PYTHON_USEDEP}] )
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	<dev-python/anyio-5[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]
	<dev-python/backoff-3.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	dev? ( ~dev-python/black-22.3.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/botocore-2[${PYTHON_USEDEP}] )
	botocore? ( <dev-python/botocore-2[${PYTHON_USEDEP}] )
	dev? ( <dev-python/botocore-2[${PYTHON_USEDEP}] )
	test? ( <dev-python/botocore-2[${PYTHON_USEDEP}] )
	dev? ( <dev-python/check-manifest-1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/flake8-3.8.1[${PYTHON_USEDEP}] )
	<dev-python/graphql-core-3.3[${PYTHON_USEDEP}]
	dev-python/graphql-core[${PYTHON_USEDEP}]
	all? ( <dev-python/httpx-1[${PYTHON_USEDEP}] )
	dev? ( <dev-python/httpx-1[${PYTHON_USEDEP}] )
	httpx? ( <dev-python/httpx-1[${PYTHON_USEDEP}] )
	test? ( <dev-python/httpx-1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/isort-4.3.21[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/mock-4.0.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/mock-4.0.2[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/mock-4.0.2[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/mypy-0.910[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/parse-1.15.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/parse-1.15.0[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/parse-1.15.0[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-7.4.2[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-7.4.2[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-7.4.2[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-asyncio-0.21.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-asyncio-0.21.1[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-asyncio-0.21.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-console-scripts-1.3.1[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	dev? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	requests? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	test? ( <dev-python/requests-3[${PYTHON_USEDEP}] )
	all? ( <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	dev? ( <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	requests? ( <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	test? ( <dev-python/requests-toolbelt-2[${PYTHON_USEDEP}] )
	dev? ( <dev-python/sphinx-6[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/sphinx-argparse-0.2.5[${PYTHON_USEDEP}] )
	dev? ( <dev-python/sphinx-rtd-theme-1[${PYTHON_USEDEP}] )
	dev? ( dev-python/types-aiofiles[${PYTHON_USEDEP}] )
	dev? ( dev-python/types-mock[${PYTHON_USEDEP}] )
	dev? ( dev-python/types-requests[${PYTHON_USEDEP}] )
	dev? ( ~dev-python/vcrpy-4.4.0[${PYTHON_USEDEP}] )
	test? ( ~dev-python/vcrpy-4.4.0[${PYTHON_USEDEP}] )
	test_no_transport? ( ~dev-python/vcrpy-4.4.0[${PYTHON_USEDEP}] )
	all? ( <dev-python/websockets-12[${PYTHON_USEDEP}] )
	dev? ( <dev-python/websockets-12[${PYTHON_USEDEP}] )
	test? ( <dev-python/websockets-12[${PYTHON_USEDEP}] )
	websockets? ( <dev-python/websockets-12[${PYTHON_USEDEP}] )
	<dev-python/yarl-2.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/yarl-1.6[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
