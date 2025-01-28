# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/http-ece[${PYTHON_USEDEP}]
	~dev-python/http-ece-1.1.0[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	<dev-python/protobuf-6[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	docs? ( ~dev-python/sphinx-7.1.2[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-autodoc-typehints-1.24[${PYTHON_USEDEP}] )
	docs? ( ~dev-python/sphinx-rtd-theme-1.3[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
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
