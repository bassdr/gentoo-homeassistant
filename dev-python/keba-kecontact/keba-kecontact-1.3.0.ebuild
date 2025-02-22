# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A python library to communicate with the KEBA charging stations via udp"
HOMEPAGE="
  https://pypi.org/project/keba-kecontact/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS="README.md"

REQUIRES_DIST="
	asyncio-dgram>=2.2.0
	pytest; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/asyncio-dgram-2.2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
