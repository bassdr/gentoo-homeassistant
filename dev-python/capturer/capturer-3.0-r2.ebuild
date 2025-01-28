# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/capturer/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/humanfriendly-8.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/humanfriendly[${PYTHON_USEDEP}]"

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_test() {
	epytest ${PN}/tests.py
}
