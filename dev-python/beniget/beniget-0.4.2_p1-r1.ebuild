# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi
SRC_URI="$(pypi_sdist_url ${PN} 0.4.2.post1)"
S="${WORKDIR}/${PN}-0.4.2.post1"

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/beniget/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	gast>=0.5.0
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/gast-0.5.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/gast-0.5.0[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest
