# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="OVO Energy"
HOMEPAGE="
  https://pypi.org/project/ovoenergy/
"
SRC_URI="https://github.com/timmo001/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${RDEPEND}
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.9_beta0[${PYTHON_USEDEP}]' python3_13{,t})
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.6.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.6.1[${PYTHON_USEDEP}]"
BDEPEND=">=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
