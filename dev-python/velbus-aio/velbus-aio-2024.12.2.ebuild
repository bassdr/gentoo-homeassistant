# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Open-source home automation platform running on Python 3."
HOMEPAGE="
  https://pypi.org/project/velbus-aio/
  Source Code, https://github.com/Cereal2nd/velbus-aio
  Bug Reports, https://github.com/Cereal2nd/velbus-aio/issues
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	aiofile
	backoff>=1.10.0
	pyserial-asyncio_fast>=0.11
	pyserial>=3.5.0
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/aiofile[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
