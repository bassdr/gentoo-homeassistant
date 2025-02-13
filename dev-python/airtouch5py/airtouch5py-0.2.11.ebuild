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

GENERATED_DEPEND="${RDEPEND}
	<dev-python/bitarray-3.0.0[${PYTHON_USEDEP}]
	<dev-python/crc-5.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	dev-python/bitarray[${PYTHON_USEDEP}]
	dev-python/crc[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
