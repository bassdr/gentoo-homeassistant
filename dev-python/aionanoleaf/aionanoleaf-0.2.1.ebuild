# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python package for the Nanoleaf API"
HOMEPAGE="
  https://pypi.org/project/aionanoleaf/
  Say Thanks!, https://saythanks.io/to/milan.meulemans@live.be
  Bug Tracker, https://github.com/milanmeu/aionanoleaf/issues
  Source Code, https://github.com/milanmeu/aionanoleaf
  Documentation, https://github.com/milanmeu/aionanoleaf/blob/main/README.md
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
