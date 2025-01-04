# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for the DOODS image detection service"
HOMEPAGE="
  https://pypi.org/project/pydoods/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
