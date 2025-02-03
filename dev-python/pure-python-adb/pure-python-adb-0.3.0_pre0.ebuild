# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 0.3.0.dev0)"
S="${WORKDIR}/${PN}-0.3.0.dev0"

DESCRIPTION="Pure python implementation of the adb client"
HOMEPAGE="
  https://pypi.org/project/pure-python-adb/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+async test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="async? ( >=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
