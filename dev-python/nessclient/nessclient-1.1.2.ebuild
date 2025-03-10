# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Implementation/abstraction of the Ness D8x / D16x Serial Interface ASCII protocol"
HOMEPAGE="
  https://pypi.org/project/nessclient/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="cli"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	click; extra == 'cli'
	dataclasses; python_version < '3.7'
	justbackoff
	pyserial-asyncio
"
GENERATED_RDEPEND="${RDEPEND}
	cli? ( dev-python/click[${PYTHON_USEDEP}] )
	dev-python/justbackoff[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/justbackoff[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
