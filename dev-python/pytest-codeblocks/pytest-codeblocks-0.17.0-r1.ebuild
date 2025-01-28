# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pytest_codeblocks/"
SRC_URI="
	https://github.com/nschloe/pytest-codeblocks/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND}
	>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	epytest -p pytester
}
# PYPI_PN could not be inserted in this ebuild
