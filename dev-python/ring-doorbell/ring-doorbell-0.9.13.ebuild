# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
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
GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-23[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/asyncclick-8.1.7.1[${PYTHON_USEDEP}]
	>=dev-python/firebase-messaging-0.4.0[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	<dev-python/oauthlib-4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.0[${PYTHON_USEDEP}]
	docs? ( <dev-python/sphinx-7.2.6[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinx-rtd-theme-1.3[${PYTHON_USEDEP}] =dev-python/sphinx-rtd-theme-1*[${PYTHON_USEDEP}] )
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
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
