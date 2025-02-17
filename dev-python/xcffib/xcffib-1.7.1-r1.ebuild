# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/xcffib/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND="
	x11-libs/libxcb
"
REQUIRES_DIST="
	cffi>=1.1.0; platform_python_implementation != 'PyPy'
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/cffi-1.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	$(python_gen_cond_dep '
		>=dev-python/cffi-1.1:=[${PYTHON_USEDEP}]
	' 'python*')
	${DEPEND}
"
BDEPEND="
	test? (
		x11-base/xorg-server[xvfb]
		x11-apps/xeyes
	)
"

distutils_enable_tests pytest

python_test() {
	rm -rf xcffib || die
	epytest
}
