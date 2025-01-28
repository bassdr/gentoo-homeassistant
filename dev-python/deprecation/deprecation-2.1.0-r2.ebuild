# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/deprecation/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_sphinx docs
distutils_enable_tests unittest

src_prepare() {
	sed -i -e 's:unittest2:unittest:' tests/test_deprecation.py || die
	distutils-r1_src_prepare
}
