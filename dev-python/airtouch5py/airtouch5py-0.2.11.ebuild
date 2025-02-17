# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/airtouch5py/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	bitarray<3.0.0,>=2.8.0
	crc<5.0.0,>=4.3.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/bitarray-2.8.0[${PYTHON_USEDEP}] <dev-python/bitarray-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/crc-4.3.0[${PYTHON_USEDEP}] <dev-python/crc-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
