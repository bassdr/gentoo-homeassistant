# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools to fetch zoneinfo with asyncio"
HOMEPAGE="
  https://pypi.org/project/aiozoneinfo/
  Bug Tracker, https://github.com/bluetooth-devices/aiozoneinfo/issues
  Changelog, https://github.com/bluetooth-devices/aiozoneinfo/blob/main/CHANGELOG.md
  Documentation, https://aiozoneinfo.readthedocs.io
  Repository, https://github.com/bluetooth-devices/aiozoneinfo
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	backports.zoneinfo>=0.2.0; python_version < '3.9'
	tzdata>=2024.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/tzdata-2024.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/tzdata-2024.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
