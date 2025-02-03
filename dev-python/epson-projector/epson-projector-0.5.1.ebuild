# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Epson projector support for Python"
HOMEPAGE="
  https://pypi.org/project/epson-projector/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
DOCS="README.md"

IUSE=""
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.4[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.4[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]"
