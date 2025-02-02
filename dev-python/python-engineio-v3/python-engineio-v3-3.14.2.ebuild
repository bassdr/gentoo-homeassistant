# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Engine.IO server"
HOMEPAGE="
  https://pypi.org/project/python-engineio-v3/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.rst"

GENERATED_IUSE="asyncio-client client"
IUSE="${GENERATED_IUSE}"
GENERATED_DEPEND="${RDEPEND}
	asyncio-client? ( >=dev-python/aiohttp-3.4[${PYTHON_USEDEP}] )
	client? ( >=dev-python/requests-2.21.0[${PYTHON_USEDEP}] )
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	client? ( >=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

# pypi tarball does not contain tests
RESTRICT="test"

python_test() {
	esetup.py test || die "Tests failed under ${EPYTHON}"
}
