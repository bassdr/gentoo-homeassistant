# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION="itertools and builtins for AsyncIO and mixed iterables"
HOMEPAGE="
  https://pypi.org/project/aioitertools/
  Documentation, https://aioitertools.omnilib.dev
  Github, https://github.com/omnilib/aioitertools
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

python_test() {
	"${EPYTHON}" -m aioitertools.tests || die
}
# Requires could not be inserted in this ebuild
# RDEPEND could not be inserted in this ebuild
# extras could not be inserted in this ebuild
# BDEPEND could not be inserted in this ebuild
