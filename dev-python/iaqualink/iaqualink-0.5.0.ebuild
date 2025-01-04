# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous library for Jandy iAqualink"
HOMEPAGE="
  https://pypi.org/project/iaqualink/
  Homepage, https://github.com/flz/iaqualink-py
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
