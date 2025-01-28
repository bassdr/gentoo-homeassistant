# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library for interacting with Android TV using the Android TV Remote protocol v2"
HOMEPAGE="
  https://pypi.org/project/androidtvremote2/
  Homepage, https://github.com/tronikos/androidtvremote2
  Bug Tracker, https://github.com/tronikos/androidtvremote2/issues
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiofiles-0.8[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.21[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiofiles-0.8[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.21[${PYTHON_USEDEP}]"

src_prepare() {
	rm src/demo.py
	distutils-r1_src_prepare
}

distutils_enable_tests pytest
