# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="asyncio client for the Awair GraphQL and Local APIs"
HOMEPAGE="
  https://pypi.org/project/python-awair/
  Repository, https://github.com/ahayworth/python_awair
  Say Thanks, https://saythanks.io/to/ahayworth@gmail.com
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
