# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library and CLI to calculate and verify all kinds of CRC checksums"
HOMEPAGE="
  https://pypi.org/project/crc/
  Changelog, https://nicoretti.github.io/crc/changelog/unreleased/
  Documentation, https://nicoretti.github.io/crc/
  Homepage, https://nicoretti.github.io/crc/
  Issues, https://github.com/Nicoretti/crc/issues
  Repository, https://github.com/Nicoretti/crc
  Source, https://github.com/Nicoretti/crc
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
