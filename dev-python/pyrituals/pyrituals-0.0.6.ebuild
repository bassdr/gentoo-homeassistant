# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python wrapper for the Rituals Perfume Genie API"
HOMEPAGE="
  https://pypi.org/project/pyrituals/
  Say Thanks!, https://saythanks.io/to/milan.meulemans@live.be
  Bug Tracker, https://github.com/milanmeu/pyrituals/issues
  Source Code, https://github.com/milanmeu/pyrituals
  Documentation, https://github.com/milanmeu/pyrituals/blob/main/README.md
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
