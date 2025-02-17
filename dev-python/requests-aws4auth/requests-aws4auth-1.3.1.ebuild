# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="AWS4 authentication for Requests"
HOMEPAGE="
  https://pypi.org/project/requests-aws4auth/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE="httpx"
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

REQUIRES_DIST="
	httpx; extra == 'httpx'
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	httpx? ( dev-python/httpx[${PYTHON_USEDEP}] )
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
