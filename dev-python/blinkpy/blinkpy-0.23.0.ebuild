# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A Blink camera Python Library."
HOMEPAGE="
  https://pypi.org/project/blinkpy/
  Source Code, https://github.com/fronzbot/blinkpy
  Bug Reports, https://github.com/fronzbot/blinkpy/issues
"
SRC_URI="https://github.com/fronzbot/blinkpy/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	aiofiles>=23.1.0
	aiohttp>=3.8.4
	python-dateutil>=2.8.1
	python-slugify>=4.0.1
	requests>=2.24.0
	sortedcontainers~=2.4.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}] =dev-python/sortedcontainers-2.4*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	>=dev-python/testtools-2.4.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
