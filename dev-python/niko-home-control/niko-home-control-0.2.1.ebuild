# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="SDK for Niko Home Control"
HOMEPAGE="
  https://pypi.org/project/niko-home-control/
"
SRC_URI="https://github.com/NoUseFreak/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/nclib[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/nclib[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
