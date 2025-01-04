# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Watch for DHCP packets with asyncio"
HOMEPAGE="
  https://pypi.org/project/aiodhcpwatcher/
  Bug Tracker, https://github.com/bdraco/aiodhcpwatcher/issues
  Changelog, https://github.com/bdraco/aiodhcpwatcher/blob/main/CHANGELOG.md
  Documentation, https://aiodhcpwatcher.readthedocs.io
  Repository, https://github.com/bdraco/aiodhcpwatcher
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/scapy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} >=net-analyzer/scapy-2.5.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest