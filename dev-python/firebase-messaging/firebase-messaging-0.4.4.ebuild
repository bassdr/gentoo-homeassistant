# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="FCM/GCM push notification client"
HOMEPAGE="
  https://pypi.org/project/firebase-messaging/
  Homepage, https://github.com/sdb9696/firebase-messaging
  Repository, https://github.com/sdb9696/firebase-messaging
  Documentation, http://firebase-messaging.readthedocs.io/
  Bug Tracker, https://github.com/sdb9696/firebase-messaging/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/http-ece[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/http-ece[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"

src_prepare() {
	remove uneccesary include
	sed "53,55d" -i pyproject.toml || die
	eapply_user
}
distutils_enable_tests pytest
