# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/cons/"
SRC_URI="
	https://github.com/pythological/python-cons/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/python-${P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	dev-python/logical-unification[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
