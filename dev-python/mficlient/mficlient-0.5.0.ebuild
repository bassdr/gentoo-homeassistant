# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A remote control client for Ubiquiti's UVC NVR"
HOMEPAGE="
  https://pypi.org/project/mficlient/
  Bug Tracker, https://github.com/uilibs/mficlient/issues
  Changelog, https://github.com/uilibs/mficlient/blob/main/CHANGELOG.md
  Repository, https://github.com/uilibs/mficlient
"

LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	requests<3.0.0,>=2.26.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.26.0[${PYTHON_USEDEP}] <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

PATCHES="${FILESDIR}/${P}-build-system.patch"

