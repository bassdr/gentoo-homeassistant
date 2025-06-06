# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION="Converts XML to Python objects"
HOMEPAGE="
  https://pypi.org/project/untangle/
"
SRC_URI="
	https://github.com/stchris/untangle/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	defusedxml (>=0.7.1,<0.8.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] <dev-python/defusedxml-0.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	# poetry, sigh
	sed -i -e 's:\^:>=:' pyproject.toml || die
}
