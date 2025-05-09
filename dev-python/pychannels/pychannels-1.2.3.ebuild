# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="API client for the Channels app - https://getchannels.com"
HOMEPAGE="
  https://pypi.org/project/pychannels/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

REQUIRES_DIST="
	requests (>=2.0)
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
