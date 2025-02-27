# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_PN="pyElectra"
DISTUTILS_USE_PEP517=setuptools
DESCRIPTION="Electra Smart Python Integration."
HOMEPAGE="
  https://pypi.org/project/pyelectra/
  homepage, https://pypi.org/project/pyelectra/
  repository, https://github.com/jafar-atili/pyelectra/
"
inherit distutils-r1
SRC_URI="https://github.com/jafar-atili/${PYPI_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PYPI_PN}-${PV}"

LICENSE="Apache-2.0"
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
distutils_enable_tests pytest
