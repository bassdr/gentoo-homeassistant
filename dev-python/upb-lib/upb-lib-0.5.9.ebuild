# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Library for interacting with UPB PIM."
HOMEPAGE="
  https://pypi.org/project/upb-lib/
"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG.md"

GENERATED_DEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -e 's/"CHANGELOG.md",//' -i pyproject.toml || die
	eapply "${FILESDIR}/${PN}-rename-cmdr.patch"
	mv "${WORKDIR}/upb_lib-${PV}/bin/cmdr.py" "${WORKDIR}/upb_lib-${PV}/bin/upb_cmdr.py"
	mv "${WORKDIR}/upb_lib-${PV}/bin/simple" "${WORKDIR}/upb_lib-${PV}/bin/upb_simple"
	eapply_user
}

distutils_enable_tests pytest
