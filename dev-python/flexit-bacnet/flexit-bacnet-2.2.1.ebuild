# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="flexit_bacnet"

inherit distutils-r1 pypi

DESCRIPTION="Client BACnet library for Flexit Nordic series of air handling units."
HOMEPAGE="
  https://pypi.org/project/flexit_bacnet/
  Homepage, https://github.com/piotrbulinski/flexit_bacnet
  Bug Tracker, https://github.com/piotrbulinski/flexit_bacnet/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
distutils_enable_tests pytest
