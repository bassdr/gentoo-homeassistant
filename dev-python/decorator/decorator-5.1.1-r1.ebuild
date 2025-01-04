# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Decorators for Humans"
HOMEPAGE="
  https://pypi.org/project/decorator/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

DOCS=( CHANGES.md )

python_test() {
	"${EPYTHON}" src/tests/test.py -v || die "Tests failed with ${EPYTHON}"
}
