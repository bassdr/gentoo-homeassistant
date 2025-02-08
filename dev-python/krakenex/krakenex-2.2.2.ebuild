# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="kraken.com cryptocurrency exchange API"
HOMEPAGE="
  https://pypi.org/project/krakenex/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	requests<3,>=2.18.2
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.18.2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.18.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
