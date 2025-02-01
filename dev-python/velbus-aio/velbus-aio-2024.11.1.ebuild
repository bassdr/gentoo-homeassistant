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
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/aiofile[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	dev-python/backoff[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5.0[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	dev-python/aiofile[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
