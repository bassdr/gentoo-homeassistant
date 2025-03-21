# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="RitAssist API Access"
HOMEPAGE="
  https://pypi.org/project/ritassist/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

REQUIRES_DIST="
	ciso8601
	geopy
	requests
"
GENERATED_RDEPEND="${RDEPEND}
	dev-python/ciso8601[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/ciso8601[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
