# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

MY_P=munkres-release-${PV}
DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/munkres/"
SRC_URI="
	https://github.com/bmc/munkres/archive/release-${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/bmc/munkres/pull/41
	"${FILESDIR}/${P}-test-32bit.patch"
)
