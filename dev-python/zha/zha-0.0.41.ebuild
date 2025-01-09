# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library implementing ZHA for Home Assistant"
HOMEPAGE="
  https://pypi.org/project/zha/
  repository, https://github.com/zigpy/zha
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/bellows[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
	dev-python/zha-quirks[${PYTHON_USEDEP}]
	dev-python/zigpy[${PYTHON_USEDEP}]
	dev-python/zigpy-deconz[${PYTHON_USEDEP}]
	dev-python/zigpy-xbee[${PYTHON_USEDEP}]
	dev-python/zigpy-zigate[${PYTHON_USEDEP}]
	dev-python/zigpy-znp[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest
