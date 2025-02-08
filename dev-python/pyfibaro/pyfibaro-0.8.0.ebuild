# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Simple API to access fibaro home center from any Python 3 script. Designed for Home Assistant (but not only)"
HOMEPAGE="
  https://pypi.org/project/pyfibaro/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	requests~=2.28
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/requests-2.28[${PYTHON_USEDEP}] =dev-python/requests-2*[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
