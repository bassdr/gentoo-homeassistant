# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="LaCrosse sensor library"
HOMEPAGE="
  https://pypi.org/project/pylacrosse/
"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

GENERATED_DEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} dev-python/pyserial[${PYTHON_USEDEP}]"

src_prepare() {
	sed "s/find_packages()/find_packages(exclude=('tests', 'tests.*'))/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest
