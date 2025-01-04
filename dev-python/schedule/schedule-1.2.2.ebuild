# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13,13t} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Job scheduling for humans."
HOMEPAGE="
  https://pypi.org/project/schedule/
  Documentation, https://schedule.readthedocs.io
  Repository, https://github.com/dbader/schedule.git
  Issues, https://github.com/dbader/schedule/issues
  Changelog, https://github.com/dbader/schedule/blob/master/HISTORY.rst
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest