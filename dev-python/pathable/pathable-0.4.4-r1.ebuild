# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pathable/"
SRC_URI="
	https://github.com/p1c2u/pathable/archive/${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

src_prepare() {
	sed -e '/--cov/d' -i pyproject.toml || die
	distutils-r1_src_prepare
}
