# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for the GitHub API"
HOMEPAGE="
  https://pypi.org/project/aiogithubapi/
  Repository, https://github.com/ludeeus/aiogithubapi
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="deprecated-verify"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	<dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
	<dev-python/async-timeout-5[${PYTHON_USEDEP}]
	<dev-python/backoff-3[${PYTHON_USEDEP}]
	deprecated-verify? ( <dev-python/securesystemslib-1[${PYTHON_USEDEP}] )
	deprecated-verify? ( >=dev-python/setuptools-60.0.0[${PYTHON_USEDEP}] )
	deprecated-verify? ( <dev-python/sigstore-2[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	dev-python/sigstore[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
