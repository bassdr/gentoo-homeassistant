# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python Client for ONVIF Camera"
HOMEPAGE="
  https://pypi.org/project/onvif-zeep-async/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

REQUIRES_DIST="
	ciso8601>=2.1.3
	httpx<1.0.0,>=0.19.0
	zeep[async]<5.0.0,>=4.2.1
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.19.0[${PYTHON_USEDEP}] <dev-python/httpx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/zeep-4.2.1[async,${PYTHON_USEDEP}] <dev-python/zeep-5.0.0[async,${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/httpx-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/zeep-4.2.1[async,${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
