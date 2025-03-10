# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Communicate with the AVM FRITZ!Box"
HOMEPAGE="
  https://pypi.org/project/fritzconnection/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="qr"
IUSE="${GENERATED_IUSE} +qr"

DOCS="README.md"

REQUIRES_DIST="
	requests>=2.22.0
	segno>=1.4.1; extra == 'qr'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	qr? ( >=dev-python/segno-1.4.1[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	qr? ( >=dev-python/segno-1.4.1[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest
