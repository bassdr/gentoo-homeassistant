# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Python Protocol Abstraction Library For Arduino Firmata using Python asyncio"
HOMEPAGE="
  https://pypi.org/project/pymata-express/
"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	pyserial
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pyserial[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
