# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/ldap3/"
SRC_URI="
	https://github.com/cannatag/ldap3/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

# tests require a ldap server and extra configuration
RESTRICT="test"

GENERATED_DEPEND="
	>=dev-python/pyasn1-0.4.6[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pyasn1-0.4.8[${PYTHON_USEDEP}]
"
