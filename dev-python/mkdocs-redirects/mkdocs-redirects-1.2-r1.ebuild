# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} 1.2.0)"
S="${WORKDIR}/${PN}-1.2.0"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mkdocs-redirects/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	>=dev-python/mkdocs-1.1.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
