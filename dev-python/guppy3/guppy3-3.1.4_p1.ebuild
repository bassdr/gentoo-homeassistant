# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_12 )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 3.1.4.post1)"
S="${WORKDIR}/$(pypi_normalize_name ${PN})-3.1.4.post1"

DESCRIPTION="Guppy 3 -- Guppy-PE ported to Python 3"
HOMEPAGE="
  https://pypi.org/project/guppy3/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"


distutils_enable_tests pytest
