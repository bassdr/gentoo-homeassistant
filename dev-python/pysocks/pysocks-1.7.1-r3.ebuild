# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

PYPI_NO_NORMALIZE=1
PYPI_PN="PySocks"
inherit distutils-r1 pypi

DESCRIPTION="A Python SOCKS client module. See https://github.com/Anorov/PySocks for more information."
HOMEPAGE="
  https://pypi.org/project/pysocks/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

# tests are broken beyond repair and the package is no longer maintained
RESTRICT="test"
