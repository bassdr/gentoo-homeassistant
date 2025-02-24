# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Discover, connect and control Gree based minisplit systems"
HOMEPAGE="
  https://pypi.org/project/greeclimate/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	netifaces
	pycryptodome~=3.10
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.10[${PYTHON_USEDEP}] =dev-python/pycryptodome-3*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
