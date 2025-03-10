# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python implementation of ADB with shell and FileSync functionality."
HOMEPAGE="
  https://pypi.org/project/adb-shell/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="+async test usb"

DOCS="README.rst"

REQUIRES_DIST="
	cryptography
	pyasn1
	rsa
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/rsa[${PYTHON_USEDEP}]
"
# pyasn1 was renamed to pysnmp-pyasn1 for versions >= 1, but most packages seem to depend on the 0.* versions still
RDEPEND="${GENERATED_RDEPEND}
	async? ( >=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}] )
	dev-python/cryptography[${PYTHON_USEDEP}]
	|| ( dev-python/pyasn1[${PYTHON_USEDEP}] dev-python/pysnmp-pyasn1[${PYTHON_USEDEP}] )
	dev-python/rsa[${PYTHON_USEDEP}]
	usb? ( >=dev-python/libusb1-1.0.16[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
