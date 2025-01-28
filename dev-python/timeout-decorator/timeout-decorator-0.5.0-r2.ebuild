# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

EGIT_COMMIT=9fbc3ef5b6f8f8cba2eb7ba795813d6ec543e265
MY_P=${PN}-${EGIT_COMMIT}

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/timeout-decorator/"
SRC_URI="
	https://github.com/pnpnpn/timeout-decorator/archive/${EGIT_COMMIT}.tar.gz
		-> ${MY_P}.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

distutils_enable_tests pytest
