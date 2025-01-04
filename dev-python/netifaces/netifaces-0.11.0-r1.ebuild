# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Portable network interface information."
HOMEPAGE="
  https://pypi.org/project/netifaces/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

PATCHES=(
	"${FILESDIR}"/${PN}-0.10.4-remove-osx-fix.patch
	"${FILESDIR}"/${PN}-0.11.0-musl-clang16-null.patch
)

python_test() {
	"${EPYTHON}" test.py || die "Tests failed with ${EPYTHON}"
}
