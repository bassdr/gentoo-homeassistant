# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/fastimport/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"

python_test() {
	"${EPYTHON}" -m unittest -v fastimport.tests.test_suite ||
		die "Tests fail with ${EPYTHON}"
}
