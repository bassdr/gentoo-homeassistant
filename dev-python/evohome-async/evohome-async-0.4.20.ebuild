# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1
SRC_URI="https://github.com/zxdavb/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="An async client for connecting to Honeywell's TCC RESTful API."
HOMEPAGE="
  https://pypi.org/project/evohome-async/
  Homepage, https://github.com/zxdavb/evohome-async
  Bug Tracker, https://github.com/zxdavb/evohome-async/issues
  Wiki, https://github.com/zxdavb/evohome-async/wiki
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.13.1[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
	}
