# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="Core utilities for Python packages"
HOMEPAGE="
  https://pypi.org/project/packaging/
  Documentation, https://packaging.pypa.io/
  Source, https://github.com/pypa/packaging
"

LICENSE="|| ( Apache-2.0 BSD-2 )"
SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	!<dev-python/setuptools-67
"
DEPEND="
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest --capture=no
}
