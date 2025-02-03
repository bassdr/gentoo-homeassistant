# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="a library for controlling certain robot vacuums"
HOMEPAGE="
  https://pypi.org/project/py-sucks/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/click-6[${PYTHON_USEDEP}]
	>=dev-python/pycountry-convert-0.5[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/sleekxmppfs-1.4.1[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/sleekxmppfs-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/click-6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4[${PYTHON_USEDEP}]
	>=dev-python/pycountry-convert-0.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
