# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="API For huawei LAN/WAN LTE Modems"
HOMEPAGE="
  https://pypi.org/project/huawei-lte-api/
  Release notes, https://github.com/Salamek/huawei-lte-api/releases
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	pycryptodomex
	requests
	xmltodict
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
"

python_prepare_all() {
	# make cryptodome-friendly
	sed -i -e 's:pycryptodomex:pycryptodome:' setup.py || die
	find -name '*.py' -exec \
		sed -i -e 's:Cryptodome:Crypto:g' {} + || die

	distutils-r1_python_prepare_all
}

distutils_enable_tests pytest
