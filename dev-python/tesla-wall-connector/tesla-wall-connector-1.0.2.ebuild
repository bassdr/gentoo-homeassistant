# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="API Library for communicating with a Tesla Wall Connector"
HOMEPAGE="
  https://pypi.org/project/tesla-wall-connector/
  Repository, https://github.com/einarhauks/tesla-wall-connector
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
