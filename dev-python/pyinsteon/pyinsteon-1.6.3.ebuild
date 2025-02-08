# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Open-source Insteon home automation module running on Python 3."
HOMEPAGE="
  https://pypi.org/project/pyinsteon/
  Source Code, https://github.com/pyinsteon/pyinsteon
  Bug Reports, https://github.com/pyinsteon/pyinsteon/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="DESCRIPTION.rst"

REQUIRES_DIST="
	aiofiles
	aiohttp
	pypubsub
	pyserial
	pyserial-asyncio>=0.5
	voluptuous
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pypubsub[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/PyPubSub[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"
