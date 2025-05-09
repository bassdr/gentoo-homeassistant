# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="This is a fork of pubnub when it still had an MIT license"
HOMEPAGE="
  https://pypi.org/project/freenub/
  Bug Tracker, https://github.com/bdraco/freenub/issues
  Changelog, https://github.com/bdraco/freenub/blob/main/CHANGELOG.md
  Repository, https://github.com/bdraco/freenub
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiohttp<4.0.0,>=3.9.5
	cbor2<6.0.0,>=5.6.4
	pycryptodomex>=3.3
	requests>=2.4
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/cbor2-5.6.4[${PYTHON_USEDEP}] <dev-python/cbor2-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	!dev-python/pubnub[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
	>=dev-python/cbor2-5.6.4[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
