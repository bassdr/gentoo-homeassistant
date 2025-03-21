# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="API for local communication with LIFX devices over a LAN with asyncio."
HOMEPAGE="
  https://pypi.org/project/aiolifx/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	InquirerPy<0.4.0,>=0.3.0
	async_timeout>=3.0.1
	bitstring
	click<8.2.0,>=8.1.0
	ifaddr
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
	dev-python/bitstring[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.0[${PYTHON_USEDEP}] <dev-python/click-8.2.0[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	>=dev-python/inquirerpy-0.3.0[${PYTHON_USEDEP}] <dev-python/inquirerpy-0.4.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	dev-python/bitstring[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/inquirerpy[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
