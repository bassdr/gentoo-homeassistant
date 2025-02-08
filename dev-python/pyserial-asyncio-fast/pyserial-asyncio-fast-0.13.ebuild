# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python Serial Port Extension - Asynchronous I/O support"
HOMEPAGE="
  https://pypi.org/project/pyserial-asyncio-fast/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	pyserial
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/pyserial-3.1.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
