# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A Python library to communicate with Ring Door Bell (https://ring.com/)"
HOMEPAGE="
  https://pypi.org/project/ring-doorbell/
  homepage, https://github.com/python-ring-doorbell/python-ring-doorbell
  repository, https://github.com/python-ring-doorbell/python-ring-doorbell
  documentation, http://python-ring-doorbell.readthedocs.io/
  Bug Tracker, https://github.com/python-ring-doorbell/python-ring-doorbell/issues
"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_DEPEND="
	dev-python/oauthlib[${PYTHON_USEDEP}]
	dev-python/firebase-messaging[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/asyncclick[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.0[${PYTHON_USEDEP}]
	>=dev-python/asyncclick-8.1.7.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	>=dev-python/firebase-messaging-0.4.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest